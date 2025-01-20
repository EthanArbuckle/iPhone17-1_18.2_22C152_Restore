@interface GKPlayerActivityRelationshipBase
+ (id)secureCodedPropertyKeys;
- (GKPlayerActivityRelationshipBase)initWithDictionary:(id)a3;
- (NSString)identifier;
- (NSString)image;
- (NSString)name;
- (id)description;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setName:(id)a3;
@end

@implementation GKPlayerActivityRelationshipBase

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_300 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_300, &__block_literal_global_302);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_299;

  return v2;
}

void __59__GKPlayerActivityRelationshipBase_secureCodedPropertyKeys__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"name";
  v3[0] = objc_opt_class();
  v2[1] = @"image";
  v3[1] = objc_opt_class();
  v2[2] = @"identifier";
  v3[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_299;
  secureCodedPropertyKeys_sSecureCodedKeys_299 = v0;
}

- (GKPlayerActivityRelationshipBase)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKPlayerActivityRelationshipBase;
  v5 = [(GKPlayerActivityRelationshipBase *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    [(GKPlayerActivityRelationshipBase *)v5 setName:v6];

    v7 = [v4 objectForKeyedSubscript:@"image"];
    [(GKPlayerActivityRelationshipBase *)v5 setImage:v7];

    v8 = [v4 objectForKeyedSubscript:@"id"];
    [(GKPlayerActivityRelationshipBase *)v5 setIdentifier:v8];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(GKPlayerActivityRelationshipBase *)self identifier];
  v5 = [(GKPlayerActivityRelationshipBase *)self name];
  v6 = [(GKPlayerActivityRelationshipBase *)self image];
  v7 = [v3 stringWithFormat:@"id: %@\nname: %@ \nimage: %@", v4, v5, v6];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end