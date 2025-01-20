@interface SHMatch
+ (BOOL)supportsSecureCoding;
- (BOOL)containsMediaItemWithFuzzyTolerance:(id)a3;
- (NSArray)mediaItems;
- (SHMatch)initWithCoder:(id)a3;
- (SHMatch)initWithMediaItems:(id)a3 forSignature:(id)a4;
- (SHSignature)querySignature;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHMatch

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMatch)initWithMediaItems:(id)a3 forSignature:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHMatch;
  v9 = [(SHMatch *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItems, a3);
    objc_storeStrong((id *)&v10->_querySignature, a4);
  }

  return v10;
}

- (BOOL)containsMediaItemWithFuzzyTolerance:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = [(SHMatch *)self mediaItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v11 = [v10 shazamID];
          objc_super v12 = [v4 shazamID];
          if ([v11 isEqualToString:v12])
          {

LABEL_15:
            BOOL v16 = 1;
            goto LABEL_16;
          }
          v13 = [v10 fuzzyRepresentation];
          v14 = [v4 fuzzyRepresentation];
          char v15 = [v13 isEqualToString:v14];

          if (v15) {
            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        BOOL v16 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
LABEL_16:
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  querySignature = self->_querySignature;
  id v5 = a3;
  [v5 encodeObject:querySignature forKey:@"signature"];
  [v5 encodeObject:self->_mediaItems forKey:@"mediaItems"];
}

- (SHMatch)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v7 = [v4 setWithArray:v6];

  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"mediaItems"];
  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];

  v10 = [(SHMatch *)self initWithMediaItems:v8 forSignature:v9];
  return v10;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (SHSignature)querySignature
{
  return self->_querySignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_querySignature, 0);

  objc_storeStrong((id *)&self->_mediaItems, 0);
}

@end