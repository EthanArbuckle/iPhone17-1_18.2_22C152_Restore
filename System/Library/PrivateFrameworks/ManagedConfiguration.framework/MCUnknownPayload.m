@interface MCUnknownPayload
+ (id)typeStrings;
- (MCUnknownPayload)initWithContentsOfPayload:(id)a3 profile:(id)a4;
- (MCUnknownPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (id)subtitle1Description;
- (id)verboseDescription;
@end

@implementation MCUnknownPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.unknown";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (MCUnknownPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MCUnknownPayload;
  v5 = [(MCPayload *)&v10 initWithDictionary:a3 profile:a4 outError:a5];
  if (v5)
  {
    v6 = +[MCUnknownPayload typeStrings];
    uint64_t v7 = [v6 firstObject];
    type = v5->super._type;
    v5->super._type = (NSString *)v7;
  }
  return v5;
}

- (MCUnknownPayload)initWithContentsOfPayload:(id)a3 profile:(id)a4
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v17[0] = @"PayloadVersion";
  v6 = (objc_class *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend([v6 alloc], "initWithInteger:", objc_msgSend(v8, "version"));
  v18[0] = v9;
  v18[1] = @"com.apple.unknown";
  v17[1] = @"PayloadType";
  v17[2] = @"PayloadIdentifier";
  objc_super v10 = [v8 identifier];
  v18[2] = v10;
  v17[3] = @"PayloadUUID";
  v11 = [v8 UUID];
  v18[3] = v11;
  v17[4] = @"PayloadDisplayName";
  v12 = [v8 displayName];

  v18[4] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v14 = (void *)[v13 mutableCopy];

  v15 = [(MCUnknownPayload *)self initWithDictionary:v14 profile:v7 outError:0];
  return v15;
}

- (id)verboseDescription
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  v6.receiver = self;
  v6.super_class = (Class)MCUnknownPayload;
  v3 = [(MCPayload *)&v6 verboseDescription];
  v4 = [v2 stringWithString:v3];

  [v4 appendFormat:@"Unknown payload.\n"];
  return v4;
}

- (id)subtitle1Description
{
  v3 = [(MCPayload *)self organization];
  if ([v3 length])
  {
    v4 = [(MCPayload *)self organization];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end