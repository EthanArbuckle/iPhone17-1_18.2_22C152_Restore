@interface SGMIAttachmentSizeHistogram
+ (id)bucketsNames;
- (BOOL)isEmpty;
- (SGMIAttachmentSizeHistogram)initWithNumberArray:(id)a3;
- (id)description;
- (id)numberArray;
- (unint64_t)count128KBTo512KB;
- (unint64_t)count32KBTo128KB;
- (unint64_t)count512KBTo2MB;
- (unint64_t)count8KBTo32KB;
- (unint64_t)countOver2MB;
- (unint64_t)countUpTo8KB;
- (void)bucketizeWithSize:(unint64_t)a3;
@end

@implementation SGMIAttachmentSizeHistogram

- (unint64_t)countOver2MB
{
  return self->_countOver2MB;
}

- (unint64_t)count512KBTo2MB
{
  return self->_count512KBTo2MB;
}

- (unint64_t)count128KBTo512KB
{
  return self->_count128KBTo512KB;
}

- (unint64_t)count32KBTo128KB
{
  return self->_count32KBTo128KB;
}

- (unint64_t)count8KBTo32KB
{
  return self->_count8KBTo32KB;
}

- (unint64_t)countUpTo8KB
{
  return self->_countUpTo8KB;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"UpTo8KB: %tu\n8KBTo32KB: %tu\n32KBTo128KB: %tu\n128KBTo512KB: %tu\n512KBTo2MB: %tu\nOver2MB: %tu", self->_countUpTo8KB, self->_count8KBTo32KB, self->_count32KBTo128KB, self->_count128KBTo512KB, self->_count512KBTo2MB, self->_countOver2MB);
  return v2;
}

- (BOOL)isEmpty
{
  return !self->_countUpTo8KB
      && !self->_count8KBTo32KB
      && !self->_count32KBTo128KB
      && !self->_count128KBTo512KB
      && !self->_count512KBTo2MB
      && self->_countOver2MB == 0;
}

- (void)bucketizeWithSize:(unint64_t)a3
{
  uint64_t v3 = 8;
  uint64_t v4 = 16;
  uint64_t v5 = 48;
  if (a3 < 0x200001) {
    uint64_t v5 = 40;
  }
  if (a3 < 0x80001) {
    uint64_t v5 = 32;
  }
  if (a3 <= 0x20000) {
    uint64_t v5 = 24;
  }
  if (a3 > 0x8000) {
    uint64_t v4 = v5;
  }
  if (a3 > 0x2000) {
    uint64_t v3 = v4;
  }
  ++*(Class *)((char *)&self->super.isa + v3);
}

- (SGMIAttachmentSizeHistogram)initWithNumberArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] != 6)
  {
    uint64_t v5 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_fault_impl(&dword_1CA650000, v5, OS_LOG_TYPE_FAULT, "Error initializing SGMIAttachmentSizeHistogram with numberArray: %@", buf, 0xCu);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SGMIAttachmentSizeHistogram;
  v6 = [(SGMIAttachmentSizeHistogram *)&v14 init];
  if (v6)
  {
    v7 = [v4 objectAtIndexedSubscript:0];
    v6->_countUpTo8KB = [v7 unsignedIntegerValue];

    v8 = [v4 objectAtIndexedSubscript:1];
    v6->_count8KBTo32KB = [v8 unsignedIntegerValue];

    v9 = [v4 objectAtIndexedSubscript:2];
    v6->_count32KBTo128KB = [v9 unsignedIntegerValue];

    v10 = [v4 objectAtIndexedSubscript:3];
    v6->_count128KBTo512KB = [v10 unsignedIntegerValue];

    v11 = [v4 objectAtIndexedSubscript:4];
    v6->_count512KBTo2MB = [v11 unsignedIntegerValue];

    v12 = [v4 objectAtIndexedSubscript:5];
    v6->_countOver2MB = [v12 unsignedIntegerValue];
  }
  return v6;
}

- (id)numberArray
{
  v11[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:self->_countUpTo8KB];
  v11[0] = v3;
  id v4 = [NSNumber numberWithUnsignedInteger:self->_count8KBTo32KB];
  v11[1] = v4;
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_count32KBTo128KB];
  v11[2] = v5;
  v6 = [NSNumber numberWithUnsignedInteger:self->_count128KBTo512KB];
  v11[3] = v6;
  v7 = [NSNumber numberWithUnsignedInteger:self->_count512KBTo2MB];
  v11[4] = v7;
  v8 = [NSNumber numberWithUnsignedInteger:self->_countOver2MB];
  v11[5] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

+ (id)bucketsNames
{
  return &unk_1F2536830;
}

@end