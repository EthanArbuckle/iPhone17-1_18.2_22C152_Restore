@interface _ATXCachedClipboardContents
- (NSDate)creationDate;
- (NSString)content;
- (NSString)originatorBundleId;
- (_ATXCachedClipboardContents)initWithContent:(id)a3 creationDate:(id)a4 originatorBundleId:(id)a5;
@end

@implementation _ATXCachedClipboardContents

- (_ATXCachedClipboardContents)initWithContent:(id)a3 creationDate:(id)a4 originatorBundleId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_ATXCachedClipboardContents;
  v11 = [(_ATXCachedClipboardContents *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    content = v11->_content;
    v11->_content = (NSString *)v12;

    objc_storeStrong((id *)&v11->_creationDate, a4);
    uint64_t v14 = [v10 copy];
    originatorBundleId = v11->_originatorBundleId;
    v11->_originatorBundleId = (NSString *)v14;

    v16 = v11;
  }

  return v11;
}

- (NSString)content
{
  return self->_content;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)originatorBundleId
{
  return self->_originatorBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorBundleId, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end