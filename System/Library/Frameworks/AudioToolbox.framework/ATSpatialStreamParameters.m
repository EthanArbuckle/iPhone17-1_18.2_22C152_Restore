@interface ATSpatialStreamParameters
- (ATSpatialStreamParameters)init;
- (AVAudioFormat)format;
- (BOOL)enableStreamWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSUUID)identifier;
- (id)description;
- (id)initInternalWithFormat:(id)a3;
- (unint64_t)hash;
- (void)disableStream;
@end

@implementation ATSpatialStreamParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NSUUID *)self->_identifier UUIDString];
  uint64_t v5 = [v4 UTF8String];
  id v6 = [(AVAudioFormat *)self->_format description];
  v7 = [v3 stringWithFormat:@"<params@%p: id %s, format %s>", self, v5, objc_msgSend(v6, "UTF8String")];

  return v7;
}

- (BOOL)isEnabled
{
  return self->_identifier != 0;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  return [(AVAudioFormat *)self->_format hash] - v3 + 32 * v3 + 961;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATSpatialStreamParameters *)a3;
  if (v4 == self)
  {
    char v12 = 1;
LABEL_12:

    return v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = 0;
    goto LABEL_12;
  }
  uint64_t v5 = v4;
  BOOL v6 = [(ATSpatialStreamParameters *)self isEnabled];
  if (v6 != [(ATSpatialStreamParameters *)v5 isEnabled]) {
    goto LABEL_10;
  }
  if (self->_identifier)
  {
    v7 = [(ATSpatialStreamParameters *)v5 identifier];

    if (v7)
    {
      identifier = self->_identifier;
      v9 = [(ATSpatialStreamParameters *)v5 identifier];
      LOBYTE(identifier) = [(NSUUID *)identifier isEqual:v9];

      if (identifier)
      {
        format = self->_format;
        v11 = [(ATSpatialStreamParameters *)v5 format];
        char v12 = [(AVAudioFormat *)format isEqual:v11];

LABEL_11:
        goto LABEL_12;
      }
LABEL_10:
      char v12 = 0;
      goto LABEL_11;
    }
  }
  _os_assert_log();
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (void)disableStream
{
  self->_identifier = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)enableStreamWithIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  identifier = self->_identifier;
  p_identifier = (id *)&self->_identifier;
  v8 = identifier;
  if (!identifier) {
    goto LABEL_4;
  }
  if ([(NSUUID *)v8 isEqual:v7])
  {
    if (*p_identifier)
    {
LABEL_5:
      if (a4) {
        *a4 = 0;
      }
      LOBYTE(a4) = 1;
      goto LABEL_10;
    }
LABEL_4:
    objc_storeStrong(p_identifier, a3);
    goto LABEL_5;
  }
  if (a4)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
    *a4 = v11;

    LOBYTE(a4) = 0;
  }
LABEL_10:

  return (char)a4;
}

- (id)initInternalWithFormat:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATSpatialStreamParameters;
  BOOL v6 = [(ATSpatialStreamParameters *)&v10 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    identifier = v6->_identifier;
    v6->_identifier = 0;

    objc_storeStrong(p_isa + 2, a3);
  }

  return p_isa;
}

- (ATSpatialStreamParameters)init
{
  return 0;
}

@end