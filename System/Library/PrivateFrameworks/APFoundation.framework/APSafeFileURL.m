@interface APSafeFileURL
- (APSafeFileURL)initWithString:(id)a3;
- (NSString)safeDescription;
- (id)URLByAppendingPathComponent:(id)a3;
- (id)description;
- (id)initFileURLWithPath:(id)a3 relativeToURL:(id)a4;
- (void)setSafeDescription:(id)a3;
@end

@implementation APSafeFileURL

- (id)initFileURLWithPath:(id)a3 relativeToURL:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSafeFileURL;
  v8 = [(APSafeFileURL *)&v11 initWithString:v7 relativeToURL:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_safeDescription, a3);
  }

  return v9;
}

- (APSafeFileURL)initWithString:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)APSafeFileURL;
  return [(APSafeFileURL *)&v4 initWithString:a3];
}

- (id)URLByAppendingPathComponent:(id)a3
{
  id v4 = a3;
  v5 = [(APSafeFileURL *)self path];
  v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = (void *)[[APSafeFileURL alloc] initFileURLWithPath:v6];
  v8 = v7;
  if (v7) {
    [v7 setSafeDescription:v4];
  }

  return v8;
}

- (id)description
{
  safeDescription = self->_safeDescription;
  if (safeDescription)
  {
    id v4 = safeDescription;
  }
  else
  {
    id v4 = [(APSafeFileURL *)self lastPathComponent];
  }
  v5 = v4;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    uint64_t v6 = [(APSafeFileURL *)self path];

    v5 = (void *)v6;
  }
  return v5;
}

- (NSString)safeDescription
{
  return self->_safeDescription;
}

- (void)setSafeDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end