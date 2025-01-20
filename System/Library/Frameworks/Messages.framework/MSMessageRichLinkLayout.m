@interface MSMessageRichLinkLayout
+ (BOOL)supportsSecureCoding;
- (LPLinkMetadata)linkMetadata;
- (MSMessageRichLinkLayout)init;
- (MSMessageRichLinkLayout)initWithCoder:(id)a3;
- (MSMessageRichLinkLayout)initWithLinkMetadata:(id)a3;
- (id)_sanitizedCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSMessageRichLinkLayout

- (MSMessageRichLinkLayout)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = [NSString stringWithFormat:@"-init is unavailable. Please use -initWithAlternateLayout: instead."];
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (MSMessageRichLinkLayout)initWithLinkMetadata:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"A linkMetadata is required for MSMessageRichLinkLayout" userInfo:0];
    objc_exception_throw(v10);
  }
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)MSMessageRichLinkLayout;
  v7 = [(MSMessageLayout *)&v11 _init];
  v8 = (MSMessageRichLinkLayout *)v7;
  if (v7) {
    objc_storeStrong(v7 + 11, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MSMessageRichLinkLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkMetadata"];

  v6 = [(MSMessageRichLinkLayout *)self initWithLinkMetadata:v5];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MSMessageRichLinkLayout alloc];
  id v5 = [(MSMessageRichLinkLayout *)self linkMetadata];
  v6 = [(MSMessageRichLinkLayout *)v4 initWithLinkMetadata:v5];

  return v6;
}

- (id)_sanitizedCopy
{
  uint64_t v3 = [MSMessageRichLinkLayout alloc];
  id v4 = [(MSMessageRichLinkLayout *)self linkMetadata];
  id v5 = [(MSMessageRichLinkLayout *)v3 initWithLinkMetadata:v4];

  return v5;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void).cxx_destruct
{
}

@end