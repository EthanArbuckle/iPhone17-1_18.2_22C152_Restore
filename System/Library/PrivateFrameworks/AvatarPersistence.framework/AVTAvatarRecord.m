@interface AVTAvatarRecord
+ (BOOL)canLoadAvatarWithData:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)dataForNeutralRecord;
+ (id)dataForNewRecord;
+ (id)defaultAvatarRecord;
+ (id)matchingIdentifierTest:(id)a3;
- (AVTAvatarRecord)init;
- (AVTAvatarRecord)initWithAvatarData:(id)a3;
- (AVTAvatarRecord)initWithAvatarData:(id)a3 identifier:(id)a4 orderDate:(id)a5;
- (AVTAvatarRecord)initWithAvatarData:(id)a3 orderDate:(id)a4;
- (AVTAvatarRecord)initWithCoder:(id)a3;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPuppet;
- (NSData)avatarData;
- (NSDate)orderDate;
- (NSString)description;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAvatarData:(id)a3;
@end

@implementation AVTAvatarRecord

+ (id)matchingIdentifierTest:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__AVTAvatarRecord_matchingIdentifierTest___block_invoke;
  v7[3] = &unk_2647C3DC0;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x22A660070](v7);

  return v5;
}

uint64_t __42__AVTAvatarRecord_matchingIdentifierTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)dataForNewRecord
{
  if (dataForNewRecord_onceToken != -1) {
    dispatch_once(&dataForNewRecord_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)dataForNewRecord_data;

  return v2;
}

void __35__AVTAvatarRecord_dataForNewRecord__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x263F296A0]);
  uint64_t v0 = [v2 dataRepresentation];
  v1 = (void *)dataForNewRecord_data;
  dataForNewRecord_data = v0;
}

+ (id)dataForNeutralRecord
{
  if (dataForNeutralRecord_onceToken != -1) {
    dispatch_once(&dataForNeutralRecord_onceToken, &__block_literal_global_3);
  }
  id v2 = (void *)dataForNeutralRecord_data;

  return v2;
}

void __39__AVTAvatarRecord_dataForNeutralRecord__block_invoke()
{
  id v2 = [MEMORY[0x263F29698] neutralMemojiDescriptor];
  uint64_t v0 = [v2 dataRepresentation];
  v1 = (void *)dataForNeutralRecord_data;
  dataForNeutralRecord_data = v0;
}

+ (BOOL)canLoadAvatarWithData:(id)a3
{
  return [MEMORY[0x263F296A0] canLoadDataRepresentation:a3];
}

+ (id)defaultAvatarRecord
{
  id v2 = [a1 dataForNeutralRecord];
  id v3 = [AVTAvatarRecord alloc];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  v5 = [(AVTAvatarRecord *)v3 initWithAvatarData:v2 orderDate:v4];

  return v5;
}

- (AVTAvatarRecord)init
{
  id v3 = [(id)objc_opt_class() dataForNeutralRecord];
  uint64_t v4 = [(AVTAvatarRecord *)self initWithAvatarData:v3];

  return v4;
}

- (AVTAvatarRecord)initWithAvatarData:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 date];
  v7 = [(AVTAvatarRecord *)self initWithAvatarData:v5 orderDate:v6];

  return v7;
}

- (AVTAvatarRecord)initWithAvatarData:(id)a3 orderDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  v9 = [v8 UUIDString];

  v10 = [(AVTAvatarRecord *)self initWithAvatarData:v7 identifier:v9 orderDate:v6];
  return v10;
}

- (AVTAvatarRecord)initWithAvatarData:(id)a3 identifier:(id)a4 orderDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AVTAvatarRecord;
  v12 = [(AVTAvatarRecord *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_avatarData, a3);
    objc_storeStrong((id *)&v12->_orderDate, a5);
  }

  return v12;
}

- (AVTAvatarRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avatarData"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orderDate"];

  id v8 = [(AVTAvatarRecord *)self initWithAvatarData:v6 identifier:v5 orderDate:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = [(AVTAvatarRecord *)self avatarData];
  [v4 encodeObject:v7 forKey:@"avatarData"];
  id v5 = [(AVTAvatarRecord *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(AVTAvatarRecord *)self orderDate];
  [v4 encodeObject:v6 forKey:@"orderDate"];
}

- (BOOL)isEditable
{
  return 1;
}

- (BOOL)isPuppet
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [AVTAvatarRecord alloc];
  id v5 = [(AVTAvatarRecord *)self avatarData];
  id v6 = [(AVTAvatarRecord *)self identifier];
  id v7 = [(AVTAvatarRecord *)self orderDate];
  id v8 = [(AVTAvatarRecord *)v4 initWithAvatarData:v5 identifier:v6 orderDate:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (AVTAvatarRecord *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(AVTAvatarRecord *)self identifier];
      if (v6
        || ([(AVTAvatarRecord *)v5 identifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v7 = [(AVTAvatarRecord *)self identifier];
        id v8 = [(AVTAvatarRecord *)v5 identifier];
        int v9 = [v7 isEqual:v8];

        if (v6)
        {

          if (!v9) {
            goto LABEL_19;
          }
        }
        else
        {

          if ((v9 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      id v11 = [(AVTAvatarRecord *)self avatarData];
      if (!v11)
      {
        id v3 = [(AVTAvatarRecord *)v5 avatarData];
        if (!v3)
        {
LABEL_14:
          v15 = [(AVTAvatarRecord *)self orderDate];
          if (v15
            || ([(AVTAvatarRecord *)v5 orderDate], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_super v16 = [(AVTAvatarRecord *)self orderDate];
            v17 = [(AVTAvatarRecord *)v5 orderDate];
            char v10 = [v16 isEqual:v17];

            if (v15)
            {
LABEL_23:

              goto LABEL_20;
            }
          }
          else
          {
            char v10 = 1;
          }

          goto LABEL_23;
        }
      }
      v12 = [(AVTAvatarRecord *)self avatarData];
      uint64_t v13 = [(AVTAvatarRecord *)v5 avatarData];
      int v14 = [v12 isEqual:v13];

      if (v11)
      {

        if (v14) {
          goto LABEL_14;
        }
      }
      else
      {

        if (v14) {
          goto LABEL_14;
        }
      }
    }
LABEL_19:
    char v10 = 0;
    goto LABEL_20;
  }
  char v10 = 1;
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(AVTAvatarRecord *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(AVTAvatarRecord *)self identifier];
  *((void *)&v7 + 1) = v4;
  *(void *)&long long v7 = [v5 hash];
  uint64_t v6 = v7 >> 43;
  id v8 = [(AVTAvatarRecord *)self avatarData];
  uint64_t v9 = [v8 hash];
  char v10 = [(AVTAvatarRecord *)self avatarData];
  *((void *)&v7 + 1) = v9;
  *(void *)&long long v7 = [v10 hash];
  id v11 = [(AVTAvatarRecord *)self orderDate];
  unint64_t v12 = (v7 >> 32) ^ v6 ^ [v11 hash];

  return v12;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarRecord;
  id v3 = [(AVTAvatarRecord *)&v8 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 appendString:@" "];
  id v5 = [(AVTAvatarRecord *)self identifier];
  [v4 appendString:v5];

  uint64_t v6 = (void *)[v4 copy];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AVTAvatarRecord *)self avatarData];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(AVTAvatarRecord *)self identifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = [NSString alloc];
    long long v7 = [(AVTAvatarRecord *)self avatarData];
    objc_super v8 = (void *)[v6 initWithData:v7 encoding:4];

    v12[0] = @"identifier";
    uint64_t v9 = [(AVTAvatarRecord *)self identifier];
    v12[1] = @"avatarDataString";
    v13[0] = v9;
    v13[1] = v8;
    char v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    char v10 = (void *)MEMORY[0x263EFFA78];
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)avatarData
{
  return self->_avatarData;
}

- (void)setAvatarData:(id)a3
{
}

- (NSDate)orderDate
{
  return self->_orderDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderDate, 0);
  objc_storeStrong((id *)&self->_avatarData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end