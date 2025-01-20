@interface QLThumbnailCachedAddition
- (BOOL)isEqual:(id)a3;
- (BOOL)isStillValid;
- (GSAddition)addition;
- (QLThumbnailCachedAddition)initWithAddition:(id)a3;
- (unint64_t)hash;
- (void)setAddition:(id)a3;
@end

@implementation QLThumbnailCachedAddition

- (QLThumbnailCachedAddition)initWithAddition:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLThumbnailCachedAddition;
  v5 = [(QLThumbnailCachedAddition *)&v11 init];
  if (!v5) {
    goto LABEL_5;
  }
  memset(&v10, 0, sizeof(v10));
  objc_msgSend(v4, "url", 0);
  id v6 = objc_claimAutoreleasedReturnValue();
  int v7 = stat((const char *)[v6 fileSystemRepresentation], &v10);

  if (!v7)
  {
    [(QLThumbnailCachedAddition *)v5 setAddition:v4];
    v5->_fileID = v10.st_ino;
LABEL_5:
    v8 = v5;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 addition];
    char v6 = [v5 isEqual:self->_addition];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(GSAddition *)self->_addition hash];
}

- (BOOL)isStillValid
{
  memset(&v6, 0, sizeof(v6));
  id v3 = [(GSAddition *)self->_addition url];
  int v4 = stat((const char *)[v3 fileSystemRepresentation], &v6);

  return !v4 && self->_fileID == v6.st_ino;
}

- (GSAddition)addition
{
  return (GSAddition *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAddition:(id)a3
{
}

- (void).cxx_destruct
{
}

@end