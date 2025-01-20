@interface PARSafariSummarizationSummarizeRequest
+ (BOOL)supportsSecureCoding;
- (Class)responseClass;
- (NSString)localeString;
- (NSString)urlString;
- (PARSafariSummarizationSummarizeRequest)initWithCoder:(id)a3;
- (unsigned)nwActivityLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setLocaleString:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation PARSafariSummarizationSummarizeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeString, 0);

  objc_storeStrong((id *)&self->_urlString, 0);
}

- (void)setLocaleString:(id)a3
{
}

- (NSString)localeString
{
  return self->_localeString;
}

- (void)setUrlString:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (unsigned)nwActivityLabel
{
  return 3;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (PARSafariSummarizationSummarizeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PARSafariSummarizationSummarizeRequest;
  v5 = [(PARRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlString"];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    localeString = v5->_localeString;
    v5->_localeString = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARSafariSummarizationSummarizeRequest;
  id v4 = a3;
  [(PARRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlString, @"urlString", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_localeString forKey:@"locale"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end