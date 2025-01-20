@interface BMSocialHighlightContact
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSocialHighlightContact)initWithHandle:(id)a3 isSignificant:(BOOL)a4 isMe:(BOOL)a5;
- (BMSocialHighlightContact)initWithProto:(id)a3;
- (BMSocialHighlightContact)initWithProtoData:(id)a3;
- (BOOL)isMe;
- (BOOL)isSignificant;
- (NSString)handle;
- (id)encodeAsProto;
- (id)proto;
- (unsigned)dataVersion;
@end

@implementation BMSocialHighlightContact

- (unsigned)dataVersion
{
  return 3;
}

- (BMSocialHighlightContact)initWithHandle:(id)a3 isSignificant:(BOOL)a4 isMe:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMSocialHighlightContact;
  v10 = [(BMEventBase *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_handle, a3);
    v11->_isSignificant = a4;
    v11->_isMe = a5;
  }

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 3)
  {
    id v4 = a3;
    v5 = [[BMSocialHighlightContact alloc] initWithProtoData:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)encodeAsProto
{
  v2 = [(BMSocialHighlightContact *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSocialHighlightContact)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 handle];
    if (v6)
    {
      v7 = [v5 handle];
      self = -[BMSocialHighlightContact initWithHandle:isSignificant:isMe:](self, "initWithHandle:isSignificant:isMe:", v7, [v5 isSignificant], objc_msgSend(v5, "isMe"));

      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BMSocialHighlightContact)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSocialHighlightContact alloc] initWithData:v4];

    self = [(BMSocialHighlightContact *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  objc_msgSend(v3, "setIsMe:", -[BMSocialHighlightContact isMe](self, "isMe"));
  objc_msgSend(v3, "setIsSignificant:", -[BMSocialHighlightContact isSignificant](self, "isSignificant"));
  id v4 = [(BMSocialHighlightContact *)self handle];
  [v3 setHandle:v4];

  return v3;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (NSString)handle
{
  return self->_handle;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void).cxx_destruct
{
}

@end