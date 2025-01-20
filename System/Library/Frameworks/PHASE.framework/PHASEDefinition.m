@interface PHASEDefinition
+ (PHASEDefinition)new;
- (NSString)identifier;
- (NSString)uid;
- (PHASEDefinition)init;
- (id)initInternal;
- (void)setIdentifier:(id)a3;
- (void)setUid:(id)a3;
@end

@implementation PHASEDefinition

- (PHASEDefinition)init
{
  return 0;
}

+ (PHASEDefinition)new
{
  return 0;
}

- (id)initInternal
{
  v8.receiver = self;
  v8.super_class = (Class)PHASEDefinition;
  v2 = [(PHASEDefinition *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v6 = v2;
  }

  return v2;
}

- (NSString)uid
{
  return self->_identifier;
}

- (void)setUid:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)&self->_identifier, a3);
  }
  else {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot set a UID of nil for a PHASEDefinition"];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end