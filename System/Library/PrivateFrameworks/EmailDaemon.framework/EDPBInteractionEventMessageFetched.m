@interface EDPBInteractionEventMessageFetched
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation EDPBInteractionEventMessageFetched

+ (id)options
{
  if (options_once != -1) {
    dispatch_once(&options_once, &__block_literal_global_52);
  }
  v2 = (void *)options_sOptions;

  return v2;
}

void __45__EDPBInteractionEventMessageFetched_options__block_invoke()
{
  v0 = (void *)options_sOptions;
  options_sOptions = (uint64_t)&unk_1F35BB698;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEventMessageFetched;
  v4 = [(EDPBInteractionEventMessageFetched *)&v8 description];
  v5 = [(EDPBInteractionEventMessageFetched *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return (id)[MEMORY[0x1E4F1CA60] dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventMessageFetchedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

@end