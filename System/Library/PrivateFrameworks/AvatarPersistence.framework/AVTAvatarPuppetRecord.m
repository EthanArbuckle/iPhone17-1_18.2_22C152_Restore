@interface AVTAvatarPuppetRecord
+ (BOOL)supportsSecureCoding;
+ (id)matchingIdentifierTest:(id)a3;
- (AVTAvatarPuppetRecord)initWithCoder:(id)a3;
- (AVTAvatarPuppetRecord)initWithPuppetName:(id)a3;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPuppet;
- (NSString)puppetName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVTAvatarPuppetRecord

+ (id)matchingIdentifierTest:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__AVTAvatarPuppetRecord_matchingIdentifierTest___block_invoke;
  v7[3] = &unk_2647C3658;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x22A660070](v7);

  return v5;
}

uint64_t __48__AVTAvatarPuppetRecord_matchingIdentifierTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 puppetName];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (AVTAvatarPuppetRecord)initWithPuppetName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarPuppetRecord;
  v5 = [(AVTAvatarPuppetRecord *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    puppetName = v5->_puppetName;
    v5->_puppetName = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEditable
{
  return 0;
}

- (BOOL)isPuppet
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (AVTAvatarPuppetRecord *)a3;
  if (v5 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(AVTAvatarPuppetRecord *)self identifier];
      if (v6
        || ([(AVTAvatarPuppetRecord *)v5 identifier],
            (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v7 = [(AVTAvatarPuppetRecord *)self identifier];
        id v8 = [(AVTAvatarPuppetRecord *)v5 identifier];
        char v9 = [v7 isEqual:v8];

        if (v6)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        char v9 = 1;
      }

      goto LABEL_11;
    }
    char v9 = 0;
  }
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  v2 = [(AVTAvatarPuppetRecord *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTAvatarPuppetRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  uint64_t v6 = [(AVTAvatarPuppetRecord *)self initWithPuppetName:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarPuppetRecord *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [AVTAvatarPuppetRecord alloc];
  id v5 = [(AVTAvatarPuppetRecord *)self puppetName];
  uint64_t v6 = [(AVTAvatarPuppetRecord *)v4 initWithPuppetName:v5];

  return v6;
}

- (NSString)puppetName
{
  return self->_puppetName;
}

- (void).cxx_destruct
{
}

@end