@interface CRKFTSEntry
- (CRKFTSEntry)initWithFTSEntry:(_ftsent *)a3 error:(id *)a4;
- (NSString)path;
- (id)errorForFTSEntry:(_ftsent *)a3;
- (stat)stat;
@end

@implementation CRKFTSEntry

- (CRKFTSEntry)initWithFTSEntry:(_ftsent *)a3 error:(id *)a4
{
  if (!a3)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"CRKFTSEntry.m", 16, @"Invalid parameter not satisfying: %@", @"FTSEntry" object file lineNumber description];
  }
  v7 = [(CRKFTSEntry *)self errorForFTSEntry:a3];
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)CRKFTSEntry;
    v10 = [(CRKFTSEntry *)&v23 init];
    if (v10)
    {
      uint64_t v11 = [NSString stringWithUTF8String:a3->fts_accpath];
      path = v10->_path;
      v10->_path = (NSString *)v11;

      fts_statp = a3->fts_statp;
      *(_OWORD *)&v10->_stat.st_dev = *(_OWORD *)&fts_statp->st_dev;
      long long v14 = *(_OWORD *)&fts_statp->st_uid;
      timespec st_atimespec = fts_statp->st_atimespec;
      timespec st_ctimespec = fts_statp->st_ctimespec;
      v10->_stat.st_mtimespec = fts_statp->st_mtimespec;
      v10->_stat.timespec st_ctimespec = st_ctimespec;
      *(_OWORD *)&v10->_stat.st_uid = v14;
      v10->_stat.timespec st_atimespec = st_atimespec;
      timespec st_birthtimespec = fts_statp->st_birthtimespec;
      long long v18 = *(_OWORD *)&fts_statp->st_size;
      long long v19 = *(_OWORD *)fts_statp->st_qspare;
      *(_OWORD *)&v10->_stat.st_blksize = *(_OWORD *)&fts_statp->st_blksize;
      *(_OWORD *)v10->_stat.st_qspare = v19;
      v10->_stat.timespec st_birthtimespec = st_birthtimespec;
      *(_OWORD *)&v10->_stat.st_size = v18;
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (id)errorForFTSEntry:(_ftsent *)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  unsigned int fts_info = a3->fts_info;
  BOOL v4 = fts_info > 0xA;
  int v5 = (1 << fts_info) & 0x490;
  if (v4 || v5 == 0)
  {
    if (a3->fts_accpath)
    {
      v7 = 0;
    }
    else
    {
      v10 = @"kCRKFilePathErrorKey";
      v11[0] = @"<nil>";
      v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      v7 = CRKErrorWithCodeAndUserInfo(19, v9);
    }
  }
  else
  {
    v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a3->fts_errno userInfo:0];
  }

  return v7;
}

- (NSString)path
{
  return self->_path;
}

- (stat)stat
{
  long long v3 = *(_OWORD *)self->st_qspare;
  *(_OWORD *)&retstr->st_size = *(_OWORD *)&self->st_blksize;
  *(_OWORD *)&retstr->st_blksize = v3;
  *(_OWORD *)retstr->st_qspare = *(_OWORD *)&self[1].st_dev;
  timespec st_ctimespec = self->st_ctimespec;
  retstr->timespec st_atimespec = self->st_mtimespec;
  retstr->st_mtimespec = st_ctimespec;
  timespec v5 = *(timespec *)&self->st_size;
  retstr->timespec st_ctimespec = self->st_birthtimespec;
  retstr->timespec st_birthtimespec = v5;
  timespec st_atimespec = self->st_atimespec;
  *(_OWORD *)&retstr->st_dev = *(_OWORD *)&self->st_uid;
  *(timespec *)&retstr->st_uid = st_atimespec;
  return self;
}

- (void).cxx_destruct
{
}

@end