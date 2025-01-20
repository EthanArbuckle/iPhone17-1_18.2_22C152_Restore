@interface GEORequestResponsePersistedEvent
+ (id)enumeratorBlockHelper:(id)a3;
- (GEORRRequestResponseEvent)rrEvent;
- (NSData)rawMessage;
- (NSDate)timestamp;
- (NSString)appId;
- (NSString)errorMessage;
- (NSString)identifier;
- (NSURL)eventFileURL;
- (NSURL)serviceURL;
- (PBCodable)decodedMessage;
- (int)eventType;
- (int)messageType;
- (unint64_t)size;
@end

@implementation GEORequestResponsePersistedEvent

- (GEORRRequestResponseEvent)rrEvent
{
  event = self->_event;
  if (event) {
    goto LABEL_2;
  }
  eventFileURL = self->_eventFileURL;
  if (!eventFileURL)
  {
    event = 0;
    goto LABEL_2;
  }
  id v12 = 0;
  v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:eventFileURL options:0 error:&v12];
  id v8 = v12;
  if (v7)
  {
    v9 = [[GEORRRequestResponseEvent alloc] initWithData:v7];
    v10 = self->_event;
    self->_event = v9;

    event = self->_event;
LABEL_2:
    v3 = event;
    goto LABEL_3;
  }
  v11 = self->_eventFileURL;
  self->_eventFileURL = 0;

  v3 = 0;
LABEL_3:

  return v3;
}

- (NSData)rawMessage
{
  v2 = [(GEORequestResponsePersistedEvent *)self rrEvent];
  v3 = [v2 encoded];

  return (NSData *)v3;
}

- (PBCodable)decodedMessage
{
  decodedMessage = self->_decodedMessage;
  if (!decodedMessage)
  {
    v4 = [(GEORequestResponsePersistedEvent *)self rrEvent];
    v5 = [v4 decodeEvent];
    v6 = self->_decodedMessage;
    self->_decodedMessage = v5;

    decodedMessage = self->_decodedMessage;
  }

  return decodedMessage;
}

+ (id)enumeratorBlockHelper:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__GEORequestResponsePersistedEvent_enumeratorBlockHelper___block_invoke;
  v7[3] = &unk_1E53EA998;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x18C120660](v7);

  return v5;
}

uint64_t __58__GEORequestResponsePersistedEvent_enumeratorBlockHelper___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, void *a6, unint64_t a7, void *a8, void *a9)
{
  id v33 = a4;
  id v32 = a5;
  id v17 = a6;
  v18 = a8;
  v19 = a9;
  v20 = objc_alloc_init(GEORequestResponsePersistedEvent);
  uint64_t v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)a2];
  timestamp = v20->_timestamp;
  v20->_timestamp = (NSDate *)v21;

  if (v17) {
    int v23 = 1;
  }
  else {
    int v23 = 2;
  }
  v20->_eventType = v23;
  v20->_messageType = a3;
  objc_storeStrong((id *)&v20->_appId, a4);
  objc_storeStrong((id *)&v20->_identifier, a5);
  if (v17)
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", v17, v32, v33);
    serviceURL = v20->_serviceURL;
    v20->_serviceURL = (NSURL *)v24;
  }
  else
  {
    serviceURL = v20->_serviceURL;
    v20->_serviceURL = 0;
  }

  eventFileURL = v20->_eventFileURL;
  v20->_size = a7;
  v20->_eventFileURL = v18;
  v27 = v18;

  errorMessage = v20->_errorMessage;
  v20->_errorMessage = v19;
  v29 = v19;

  uint64_t v30 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v30;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int)eventType
{
  return self->_eventType;
}

- (int)messageType
{
  return self->_messageType;
}

- (NSString)appId
{
  return self->_appId;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSURL)eventFileURL
{
  return self->_eventFileURL;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_eventFileURL, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_decodedMessage, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end