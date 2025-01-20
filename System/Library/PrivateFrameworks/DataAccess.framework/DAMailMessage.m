@interface DAMailMessage
- (BOOL)flagged;
- (BOOL)flaggedIsSet;
- (BOOL)isDraft;
- (BOOL)meetingRequestIsActionable;
- (BOOL)read;
- (BOOL)readIsSet;
- (BOOL)verbIsSet;
- (DAMailMessage)initWithCoder:(id)a3;
- (id)attachments;
- (id)bcc;
- (id)body;
- (id)cc;
- (id)clientID;
- (id)conversationId;
- (id)conversationIndex;
- (id)date;
- (id)displayTo;
- (id)folderID;
- (id)from;
- (id)instanceID;
- (id)longID;
- (id)meetingRequestMetaData;
- (id)meetingRequestUUID;
- (id)messageClass;
- (id)preview;
- (id)remoteID;
- (id)replyTo;
- (id)rfc822Data;
- (id)sender;
- (id)subject;
- (id)threadTopic;
- (id)to;
- (int)bodySize;
- (int)bodyTruncated;
- (int)bodyType;
- (int)importance;
- (int)lastVerb;
- (int)smimeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAMailMessage

- (id)to
{
  return 0;
}

- (id)cc
{
  return 0;
}

- (id)from
{
  return 0;
}

- (id)replyTo
{
  return 0;
}

- (id)date
{
  return 0;
}

- (id)subject
{
  return 0;
}

- (id)displayTo
{
  return 0;
}

- (int)importance
{
  return 1;
}

- (BOOL)read
{
  return 0;
}

- (BOOL)flagged
{
  return 0;
}

- (id)body
{
  return 0;
}

- (int)bodyType
{
  return 2;
}

- (int)bodySize
{
  return 0;
}

- (int)bodyTruncated
{
  return 0;
}

- (id)messageClass
{
  return 0;
}

- (id)attachments
{
  return 0;
}

- (id)meetingRequestUUID
{
  return 0;
}

- (id)meetingRequestMetaData
{
  return 0;
}

- (BOOL)meetingRequestIsActionable
{
  return 0;
}

- (id)threadTopic
{
  return 0;
}

- (id)conversationId
{
  return 0;
}

- (id)conversationIndex
{
  return 0;
}

- (id)remoteID
{
  return 0;
}

- (id)longID
{
  return 0;
}

- (id)folderID
{
  return 0;
}

- (int)lastVerb
{
  return 0;
}

- (id)sender
{
  return 0;
}

- (id)bcc
{
  return 0;
}

- (BOOL)isDraft
{
  return 0;
}

- (id)clientID
{
  return 0;
}

- (id)instanceID
{
  return 0;
}

- (id)preview
{
  return 0;
}

- (BOOL)readIsSet
{
  return 0;
}

- (BOOL)flaggedIsSet
{
  return 0;
}

- (BOOL)verbIsSet
{
  return 0;
}

- (int)smimeType
{
  return 0;
}

- (id)rfc822Data
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(DAMailMessage *)self from];
  [v4 setAddressListForSender:v5];

  v6 = [(DAMailMessage *)self date];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    v8 = [v6 dateWithCalendarFormat:@"%a, %d %b %Y %H:%M:%S %z", v7 timeZone];

    v6 = [v8 description];
  }
  else
  {
    v8 = 0;
  }
  [v4 setHeader:v6 forKey:*MEMORY[0x1E4F73400]];
  v9 = [(DAMailMessage *)self to];
  [v4 setAddressListForTo:v9];

  v10 = [(DAMailMessage *)self cc];
  [v4 setAddressListForCc:v10];

  v11 = [(DAMailMessage *)self bcc];
  [v4 setAddressListForBcc:v11];

  v12 = [(DAMailMessage *)self replyTo];
  [v4 setAddressList:v12 forKey:*MEMORY[0x1E4F73480]];

  v13 = [(DAMailMessage *)self subject];
  [v4 setHeader:v13 forKey:*MEMORY[0x1E4F73428]];

  v14 = [v4 encodedHeaders];
  if (v14) {
    [v3 appendData:v14];
  }
  v15 = [(DAMailMessage *)self body];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    v17 = [(DAMailMessage *)self body];
    v18 = [v17 dataUsingEncoding:4];

    [v3 appendData:v18];
  }

  return v3;
}

- (DAMailMessage)initWithCoder:(id)a3
{
  v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BA384000, v4, v5, "DAMailMessage initWithCoder: should be called on a subclass only", v7, 2u);
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_1BA384000, v3, v4, "DAMailMessage encodeWithCoder: should be called on a subclass only", v5, 2u);
  }
}

@end