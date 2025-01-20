@interface PARSearchReplayRequest
+ (BOOL)supportsSecureCoding;
- (NSDictionary)replayHeaderItems;
- (NSString)replaySearchURL;
- (PARSearchReplayRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setReplayHeaderItems:(id)a3;
- (void)setReplaySearchURL:(id)a3;
@end

@implementation PARSearchReplayRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayHeaderItems, 0);

  objc_storeStrong((id *)&self->_replaySearchURL, 0);
}

- (void)setReplayHeaderItems:(id)a3
{
}

- (NSDictionary)replayHeaderItems
{
  return self->_replayHeaderItems;
}

- (void)setReplaySearchURL:(id)a3
{
}

- (NSString)replaySearchURL
{
  return self->_replaySearchURL;
}

- (PARSearchReplayRequest)initWithCoder:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PARSearchReplayRequest;
  v5 = [(PARSearchRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replaySearchUrl"];
    replaySearchURL = v5->_replaySearchURL;
    v5->_replaySearchURL = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"replayHeaderItems"];
    replayHeaderItems = v5->_replayHeaderItems;
    v5->_replayHeaderItems = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARSearchReplayRequest;
  id v4 = a3;
  [(PARSearchRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_replaySearchURL, @"replaySearchUrl", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_replayHeaderItems forKey:@"replayHeaderItems"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end