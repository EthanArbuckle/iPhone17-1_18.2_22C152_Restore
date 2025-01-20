@interface CPLCloudKitComputeStateNoEncryptionHelper
- (BOOL)decryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (BOOL)encryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (CPLCloudKitComputeStateNoEncryptionHelper)init;
- (CPLCloudKitComputeStateNoEncryptionHelper)initWithPrefix:(id)a3;
- (NSData)prefix;
@end

@implementation CPLCloudKitComputeStateNoEncryptionHelper

- (CPLCloudKitComputeStateNoEncryptionHelper)initWithPrefix:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLCloudKitComputeStateNoEncryptionHelper;
  v6 = [(CPLCloudKitComputeStateNoEncryptionHelper *)&v12 init];
  if (v6)
  {
    v7 = (NSFileManager *)objc_alloc_init((Class)NSFileManager);
    fm = v6->_fm;
    v6->_fm = v7;

    uint64_t v9 = [v5 dataUsingEncoding:4];
    prefix = v6->_prefix;
    v6->_prefix = (NSData *)v9;

    if (!v6->_prefix) {
      sub_1001C7E18((uint64_t)a2, (uint64_t)v6);
    }
  }

  return v6;
}

- (CPLCloudKitComputeStateNoEncryptionHelper)init
{
  return [(CPLCloudKitComputeStateNoEncryptionHelper *)self initWithPrefix:&stru_10027FEB8];
}

- (BOOL)encryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(NSData *)self->_prefix length])
  {
    id v17 = 0;
    id v10 = [objc_alloc((Class)NSMutableData) initWithContentsOfURL:v8 options:0 error:&v17];
    id v11 = v17;
    if (v10)
    {
      objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 0, 0, -[NSData bytes](self->_prefix, "bytes"), -[NSData length](self->_prefix, "length"));
      id v16 = v11;
      unsigned __int8 v13 = [v10 writeToURL:v9 options:1 error:&v16];
      id v14 = v16;

      id v11 = v14;
      if (!a5) {
        goto LABEL_9;
      }
    }
    else
    {
      unsigned __int8 v13 = 0;
      if (!a5)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    if ((v13 & 1) == 0) {
      *a5 = v11;
    }
    goto LABEL_9;
  }
  unsigned __int8 v13 = [(NSFileManager *)self->_fm cplCopyItemAtURL:v8 toURL:v9 error:a5];
LABEL_10:

  return v13;
}

- (BOOL)decryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(NSData *)self->_prefix length])
  {
    id v23 = 0;
    id v10 = [objc_alloc((Class)NSData) initWithContentsOfURL:v8 options:0 error:&v23];
    id v11 = v23;
    if (v10)
    {
      id v12 = [v10 length];
      if (v12 >= (id)[(NSData *)self->_prefix length])
      {
        if (objc_msgSend(v10, "rangeOfData:options:range:", self->_prefix, 2, 0, -[NSData length](self->_prefix, "length")))
        {
          id v18 = objc_alloc((Class)NSError);
          NSErrorUserInfoKey v26 = NSLocalizedRecoverySuggestionErrorKey;
          CFStringRef v27 = @"Invalid pseudo-encryption prefix";
          v19 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          id v20 = [v18 initWithDomain:@"CPLComputeStateEncryptionError" code:3 userInfo:v19];
          unsigned __int8 v16 = 0;
        }
        else
        {
          v19 = objc_msgSend(v10, "subdataWithRange:", -[NSData length](self->_prefix, "length"), (unsigned char *)objc_msgSend(v10, "length") - (unsigned char *)-[NSData length](self->_prefix, "length"));
          id v22 = v11;
          unsigned __int8 v16 = [v19 writeToURL:v9 options:1 error:&v22];
          id v20 = v22;
        }

        id v11 = v20;
        if (!a5) {
          goto LABEL_15;
        }
      }
      else
      {
        id v13 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v24 = NSLocalizedRecoverySuggestionErrorKey;
        CFStringRef v25 = @"File is too short";
        id v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        id v15 = [v13 initWithDomain:@"CPLComputeStateEncryptionError" code:3 userInfo:v14];

        unsigned __int8 v16 = 0;
        id v11 = v15;
        if (!a5)
        {
LABEL_15:

          goto LABEL_16;
        }
      }
    }
    else
    {
      unsigned __int8 v16 = 0;
      if (!a5) {
        goto LABEL_15;
      }
    }
    if ((v16 & 1) == 0) {
      *a5 = v11;
    }
    goto LABEL_15;
  }
  unsigned __int8 v16 = [(NSFileManager *)self->_fm cplCopyItemAtURL:v8 toURL:v9 error:a5];
LABEL_16:

  return v16;
}

- (NSData)prefix
{
  return self->_prefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_fm, 0);
}

@end