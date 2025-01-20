@interface CNContactPoster
- (BOOL)contentIsSensitive;
- (BOOL)ignoredForRevert;
- (CNContactImage)pairedImage;
- (CNContactPoster)initWithIdentifier:(id)a3 posterData:(id)a4 lastUsedDate:(id)a5;
- (CNContactPoster)initWithPosterData:(id)a3 lastUsedDate:(id)a4;
- (NSData)posterData;
- (NSData)visualFingerprintData;
- (NSDate)lastUsedDate;
- (NSString)identifier;
- (id)copyWithNewPosterData:(id)a3;
- (void)setContentIsSensitive:(BOOL)a3;
- (void)setIgnoredForRevert:(BOOL)a3;
- (void)setPairedImage:(id)a3;
- (void)setVisualFingerprintData:(id)a3;
@end

@implementation CNContactPoster

- (CNContactPoster)initWithPosterData:(id)a3 lastUsedDate:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 UUID];
  v10 = [v9 UUIDString];

  v11 = [(CNContactPoster *)self initWithIdentifier:v10 posterData:v8 lastUsedDate:v7];
  return v11;
}

- (CNContactPoster)initWithIdentifier:(id)a3 posterData:(id)a4 lastUsedDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNContactPoster;
  v11 = [(CNContactPoster *)&v18 init];
  if (v11)
  {
    if ([v8 length])
    {
      v12 = (NSString *)v8;
      identifier = v11->_identifier;
      v11->_identifier = v12;
    }
    else
    {
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v14 = [identifier UUIDString];
      v15 = v11->_identifier;
      v11->_identifier = (NSString *)v14;
    }
    objc_storeStrong((id *)&v11->_posterData, a4);
    objc_storeStrong((id *)&v11->_lastUsedDate, a5);
    v16 = v11;
  }

  return v11;
}

- (id)copyWithNewPosterData:(id)a3
{
  id v4 = a3;
  v5 = [CNContactPoster alloc];
  v6 = [(CNContactPoster *)self identifier];
  id v7 = [(CNContactPoster *)self lastUsedDate];
  id v8 = [(CNContactPoster *)v5 initWithIdentifier:v6 posterData:v4 lastUsedDate:v7];

  [(CNContactPoster *)v8 setIgnoredForRevert:[(CNContactPoster *)self ignoredForRevert]];
  id v9 = [(CNContactPoster *)self pairedImage];
  [(CNContactPoster *)v8 setPairedImage:v9];

  [(CNContactPoster *)v8 setVisualFingerprintData:0];
  [(CNContactPoster *)v8 setContentIsSensitive:[(CNContactPoster *)self contentIsSensitive]];
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)posterData
{
  return self->_posterData;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (BOOL)ignoredForRevert
{
  return self->_ignoredForRevert;
}

- (void)setIgnoredForRevert:(BOOL)a3
{
  self->_ignoredForRevert = a3;
}

- (NSData)visualFingerprintData
{
  return self->_visualFingerprintData;
}

- (void)setVisualFingerprintData:(id)a3
{
}

- (BOOL)contentIsSensitive
{
  return self->_contentIsSensitive;
}

- (void)setContentIsSensitive:(BOOL)a3
{
  self->_contentIsSensitive = a3;
}

- (CNContactImage)pairedImage
{
  return self->_pairedImage;
}

- (void)setPairedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedImage, 0);
  objc_storeStrong((id *)&self->_visualFingerprintData, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_posterData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end