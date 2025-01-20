@interface INIntentSummary
- (INIntentSummary)initWithIntentIdentifier:(id)a3 originatingBundleId:(id)a4 languageCode:(id)a5;
- (NSString)intentIdentifier;
- (NSString)languageCode;
- (NSString)originatingBundleId;
- (NSString)subtitle;
- (NSString)title;
- (unint64_t)containedProperties;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation INIntentSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_originatingBundleId, 0);

  objc_storeStrong((id *)&self->_intentIdentifier, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)containedProperties
{
  return self->_containedProperties;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)originatingBundleId
{
  return self->_originatingBundleId;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (void)setSubtitle:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_subtitle, "isEqualToString:")) {
    objc_storeStrong((id *)&self->_subtitle, a3);
  }
  self->_containedProperties |= 2uLL;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:")) {
    objc_storeStrong((id *)&self->_title, a3);
  }
  self->_containedProperties |= 1uLL;
}

- (INIntentSummary)initWithIntentIdentifier:(id)a3 originatingBundleId:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)INIntentSummary;
  v11 = [(INIntentSummary *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    intentIdentifier = v11->_intentIdentifier;
    v11->_intentIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    originatingBundleId = v11->_originatingBundleId;
    v11->_originatingBundleId = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    languageCode = v11->_languageCode;
    v11->_languageCode = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

@end