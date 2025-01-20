@interface BUContainedZipArchive
+ (id)zipArchiveFromEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)isValid;
- (BUContainedZipArchive)initWithEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5;
- (id)newArchiveReadChannel;
- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (unint64_t)archiveLength;
@end

@implementation BUContainedZipArchive

+ (id)zipArchiveFromEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_21E1EBEDC;
  v38 = sub_21E1EBEEC;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_21E1EBEDC;
  v32 = sub_21E1EBEEC;
  id v33 = 0;
  id v12 = objc_alloc((Class)a1);
  v15 = objc_msgSend_initWithEntry_zipArchive_options_(v12, v13, (uint64_t)v10, v11, a5);
  if (v15)
  {
    v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    v17 = dispatch_get_global_queue(0, 0);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_21E1EBEF4;
    v24[3] = &unk_26449E528;
    v26 = &v34;
    v27 = &v28;
    v18 = v16;
    v25 = v18;
    objc_msgSend_readArchiveWithQueue_completion_(v15, v19, (uint64_t)v17, v24);
    dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a6 && !v35[5])
  {
    v20 = (void *)v29[5];
    if (v20)
    {
      *a6 = v20;
    }
    else
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v14, 0);
      id v21 = objc_claimAutoreleasedReturnValue();
      *a6 = v21;
    }
  }
  id v22 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v22;
}

- (BUContainedZipArchive)initWithEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  id v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)BUContainedZipArchive;
    v13 = [(BUZipArchive *)&v16 initWithOptions:a5];
    p_isa = (id *)&v13->super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_zipArchive, a4);
      objc_storeStrong(p_isa + 6, a3);
    }
    self = p_isa;
    id v12 = self;
  }

  return v12;
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BUContainedZipArchive;
  v4 = [(BUZipArchive *)&v6 readChannelForEntry:a3 validateCRC:0];

  return v4;
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BUContainedZipArchive;
  v4 = [(BUZipArchive *)&v6 streamReadChannelForEntry:a3 validateCRC:0];

  return v4;
}

- (unint64_t)archiveLength
{
  return objc_msgSend_size(self->_entry, a2, v2);
}

- (id)newArchiveReadChannel
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isValid
{
  return ((uint64_t (*)(BUZipArchive *, char *))MEMORY[0x270F9A6D0])(self->_zipArchive, sel_isValid);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);

  objc_storeStrong((id *)&self->_zipArchive, 0);
}

@end