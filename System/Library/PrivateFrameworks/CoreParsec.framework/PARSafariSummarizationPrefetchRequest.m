@interface PARSafariSummarizationPrefetchRequest
+ (BOOL)supportsSecureCoding;
- (Class)responseClass;
- (NSArray)urlVariants;
- (NSString)localeString;
- (NSString)urlString;
- (PARSafariSummarizationPrefetchRequest)initWithCoder:(id)a3;
- (unsigned)nwActivityLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setLocaleString:(id)a3;
- (void)setUrlString:(id)a3;
- (void)setUrlVariants:(id)a3;
@end

@implementation PARSafariSummarizationPrefetchRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeString, 0);
  objc_storeStrong((id *)&self->_urlVariants, 0);

  objc_storeStrong((id *)&self->_urlString, 0);
}

- (void)setLocaleString:(id)a3
{
}

- (NSString)localeString
{
  return self->_localeString;
}

- (void)setUrlVariants:(id)a3
{
}

- (NSArray)urlVariants
{
  return self->_urlVariants;
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

- (PARSafariSummarizationPrefetchRequest)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PARSafariSummarizationPrefetchRequest;
  v5 = [(PARRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"urlVariants"];
    urlVariants = v5->_urlVariants;
    v5->_urlVariants = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlString"];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    localeString = v5->_localeString;
    v5->_localeString = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARSafariSummarizationPrefetchRequest;
  id v4 = a3;
  [(PARRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlString, @"urlString", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_urlVariants forKey:@"urlVariants"];
  [v4 encodeObject:self->_localeString forKey:@"locale"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end