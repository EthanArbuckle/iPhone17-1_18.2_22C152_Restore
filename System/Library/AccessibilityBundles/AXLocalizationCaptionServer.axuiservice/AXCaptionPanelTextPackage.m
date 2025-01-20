@interface AXCaptionPanelTextPackage
- (BOOL)isEqual:(id)a3;
- (NSString)appName;
- (NSString)bundle;
- (NSString)englishText;
- (NSString)file;
- (NSString)key;
- (NSString)text;
- (id)fileLogDescription;
- (void)setAppName:(id)a3;
- (void)setBundle:(id)a3;
- (void)setEnglishText:(id)a3;
- (void)setFile:(id)a3;
- (void)setKey:(id)a3;
- (void)setText:(id)a3;
@end

@implementation AXCaptionPanelTextPackage

- (id)fileLogDescription
{
  v3 = [(AXCaptionPanelTextPackage *)self appName];
  v4 = [(AXCaptionPanelTextPackage *)self key];
  v5 = [(AXCaptionPanelTextPackage *)self text];
  v6 = [(AXCaptionPanelTextPackage *)self englishText];
  v7 = [(AXCaptionPanelTextPackage *)self bundle];
  v8 = [(AXCaptionPanelTextPackage *)self file];
  v9 = +[NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@", v3, v4, v5, v6, v7, v8];

  v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];
  v6 = [(AXCaptionPanelTextPackage *)self key];
  if ([v5 isEqual:v6])
  {
    v7 = [v4 bundle];
    v8 = [(AXCaptionPanelTextPackage *)self bundle];
    if ([v7 isEqual:v8])
    {
      v9 = [v4 file];
      v10 = [(AXCaptionPanelTextPackage *)self file];
      unsigned __int8 v11 = [v9 isEqual:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (NSString)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)englishText
{
  return self->_englishText;
}

- (void)setEnglishText:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_englishText, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_bundle, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end