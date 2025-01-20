@interface MFDataMessageStore
- (BOOL)bodyFetchRequiresNetworkActivity;
- (BOOL)messageCanBeTriaged:(id)a3;
- (MFDataMessageStore)initWithData:(id)a3;
- (id)_cachedBodyDataForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)account;
- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)mailboxUid;
- (id)message;
- (id)storagePath;
- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5;
- (void)setMailboxUid:(id)a3;
- (void)setMessageClass:(Class)a3;
- (void)setStoragePath:(id)a3;
@end

@implementation MFDataMessageStore

- (MFDataMessageStore)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFDataMessageStore;
  v6 = [(MFMessageStore *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (id)storagePath
{
  return self->_storagePath;
}

- (void)setStoragePath:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  storagePath = self->_storagePath;
  self->_storagePath = v4;
}

- (void)setMessageClass:(Class)a3
{
  self->_messageClass = a3;
}

- (id)message
{
  messageClass = self->_messageClass;
  if (!messageClass)
  {
    messageClass = (objc_class *)objc_opt_class();
    self->_messageClass = messageClass;
  }
  id v4 = objc_alloc_init(messageClass);
  [v4 setMessageStore:self];
  return v4;
}

- (id)account
{
  return 0;
}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  id v5 = a3;
  unint64_t v6 = [(NSData *)self->_data bytes];
  NSUInteger v7 = [(NSData *)self->_data length];
  if (v7)
  {
    char v8 = 0;
    unint64_t v9 = ~v6;
    while (1)
    {
      int v11 = *(unsigned __int8 *)v6++;
      int v10 = v11;
      if ((v8 & 1) != 0 && v10 == 10) {
        break;
      }
      char v8 = (v10 == 10) & ~v8;
      --v9;
      if (!--v7) {
        goto LABEL_6;
      }
    }
    v13 = +[MFData dataWithBytes:[(NSData *)self->_data bytes] length:-(uint64_t)v9 - (unint64_t)[(NSData *)self->_data bytes]];
  }
  else
  {
LABEL_6:
    v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1AFB03000, v12, OS_LOG_TYPE_DEFAULT, "#Warning NSDataMessageStore: couldn't find body", v15, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 0;
}

- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  id v9 = a3;
  if (a5) {
    *a5 = 0;
  }
  unint64_t v10 = [(NSData *)self->_data bytes];
  NSUInteger v11 = [(NSData *)self->_data length];
  if (v11)
  {
    char v12 = 0;
    uint64_t v13 = -(uint64_t)v11;
    v14 = (char *)(v10 + 1);
    while (1)
    {
      int v15 = *(v14 - 1);
      if ((v12 & 1) != 0 && v15 == 10) {
        break;
      }
      char v12 = (v15 == 10) & ~v12;
      ++v14;
      if (__CFADD__(v13++, 1)) {
        goto LABEL_9;
      }
    }
    if (a4) {
      *a4 = 1;
    }
    v18 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v14, ~v10 + -[NSData bytes](self->_data, "bytes") - v13, 0);
  }
  else
  {
LABEL_9:
    v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20[0] = 0;
      _os_log_impl(&dword_1AFB03000, v17, OS_LOG_TYPE_DEFAULT, "#Warning NSDataMessageStore: couldn't find body", (uint8_t *)v20, 2u);
    }

    v18 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v18;
}

- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v4 = a4;
  return v4;
}

- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v4 = a4;
  return v4;
}

- (id)_cachedBodyDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v4 = [(MFDataMessageStore *)self bodyDataForMessage:a3 isComplete:0 isPartial:0 downloadIfNecessary:0];
  return v4;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  id v5 = a3;
  return v5;
}

- (id)mailboxUid
{
  return self->_mailboxUid;
}

- (BOOL)messageCanBeTriaged:(id)a3
{
  return 0;
}

- (void)setMailboxUid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mailboxUid, 0);
  objc_storeStrong((id *)&self->_storagePath, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end