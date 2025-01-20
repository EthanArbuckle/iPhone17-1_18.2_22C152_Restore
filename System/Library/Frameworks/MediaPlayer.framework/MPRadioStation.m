@interface MPRadioStation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MPRadioStation)initWithCoder:(id)a3;
- (MPRadioStation)initWithModelStation:(id)a3;
- (MPRadioStation)initWithPlayParameters:(id)a3;
- (MPRadioStation)initWithStation:(id)a3;
- (NSString)localizedDescription;
- (NSString)localizedName;
- (NSString)stationStringID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)uniqueIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setStationStringID:(id)a3;
- (void)setUniqueIdentifier:(int64_t)a3;
@end

@implementation MPRadioStation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (void)setStationStringID:(id)a3
{
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setUniqueIdentifier:(int64_t)a3
{
  self->_uniqueIdentifier = a3;
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_localizedName copyWithZone:a3];
    v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSString *)self->_stationStringID copyWithZone:a3];
    v9 = (void *)v5[4];
    v5[4] = v8;

    uint64_t v10 = [(NSString *)self->_localizedDescription copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;

    v5[1] = self->_uniqueIdentifier;
  }
  return v5;
}

- (MPRadioStation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPRadioStation;
  v5 = [(MPRadioStation *)&v13 init];
  if (v5)
  {
    v5->_uniqueIdentifier = [v4 decodeInt64ForKey:@"uniqueIdentifier"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stationStringID"];
    stationStringID = v5->_stationStringID;
    v5->_stationStringID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    [v4 encodeInt64:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
    [v4 encodeObject:self->_stationStringID forKey:@"stationStringID"];
    [v4 encodeObject:self->_localizedName forKey:@"localizedName"];
    [v4 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28488] format:@"only keyed coding is supported"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int64_t v5 = [(MPRadioStation *)self uniqueIdentifier];
    BOOL v6 = v5 == [v4 uniqueIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (MPRadioStation)initWithStation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPRadioStation;
  int64_t v5 = [(MPRadioStation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    uint64_t v8 = [v4 stationDescription];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    v5->_uniqueIdentifier = [v4 stationID];
    uint64_t v10 = [v4 stationStringID];
    stationStringID = v5->_stationStringID;
    v5->_stationStringID = (NSString *)v10;
  }
  return v5;
}

- (MPRadioStation)initWithModelStation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPRadioStation;
  int64_t v5 = [(MPRadioStation *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__MPRadioStation_initWithModelStation___block_invoke;
    v8[3] = &unk_1E57F9F98;
    v9 = v5;
    id v10 = v4;
    +[MPModelObject performWithoutEnforcement:v8];
  }
  return v6;
}

void __39__MPRadioStation_initWithModelStation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) name];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) editorNotes];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  uint64_t v8 = [*(id *)(a1 + 40) identifiers];
  v9 = [v8 radio];
  *(void *)(*(void *)(a1 + 32) + 8) = [v9 stationID];

  id v14 = [*(id *)(a1 + 40) identifiers];
  id v10 = [v14 radio];
  uint64_t v11 = [v10 stationStringID];
  uint64_t v12 = *(void *)(a1 + 32);
  objc_super v13 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v11;
}

- (MPRadioStation)initWithPlayParameters:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPRadioStation;
  uint64_t v5 = [(MPRadioStation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 itemKind];
    int v7 = [v6 isEqual:@"radioStation"];

    if (!v7)
    {
      id v10 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = [v4 itemID];
    stationStringID = v5->_stationStringID;
    v5->_stationStringID = (NSString *)v8;
  }
  id v10 = v5;
LABEL_6:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end