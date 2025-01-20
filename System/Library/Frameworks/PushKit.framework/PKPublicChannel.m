@interface PKPublicChannel
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)channelID;
- (NSString)channelTopic;
- (NSString)environment;
- (NSString)tokenName;
- (PKPublicChannel)initWithChannelID:(id)a3;
- (PKPublicChannel)initWithChannelID:(id)a3 channelTopic:(id)a4 environment:(id)a5 checkpoint:(unint64_t)a6;
- (PKPublicChannel)initWithChannelID:(id)a3 channelTopic:(id)a4 environment:(id)a5 tokenName:(id)a6 checkpoint:(unint64_t)a7;
- (PKPublicChannel)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)checkpoint;
- (unint64_t)hash;
- (void)resetCheckpoint;
- (void)setChannelID:(id)a3;
- (void)setChannelTopic:(id)a3;
- (void)setCheckpoint:(unint64_t)a3;
- (void)setEnvironment:(id)a3;
@end

@implementation PKPublicChannel

- (PKPublicChannel)initWithChannelID:(id)a3
{
  return [(PKPublicChannel *)self initWithChannelID:a3 channelTopic:&stru_26C3962A0 environment:&stru_26C3962A0 tokenName:&stru_26C3962A0 checkpoint:0];
}

- (PKPublicChannel)initWithChannelID:(id)a3 channelTopic:(id)a4 environment:(id)a5 checkpoint:(unint64_t)a6
{
  return [(PKPublicChannel *)self initWithChannelID:a3 channelTopic:a4 environment:a5 tokenName:0 checkpoint:a6];
}

- (PKPublicChannel)initWithChannelID:(id)a3 channelTopic:(id)a4 environment:(id)a5 tokenName:(id)a6 checkpoint:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKPublicChannel;
  v17 = [(PKPublicChannel *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_channelID, a3);
    objc_storeStrong((id *)&v18->_channelTopic, a4);
    objc_storeStrong((id *)&v18->_environment, a5);
    objc_storeStrong((id *)&v18->_tokenName, a6);
    v18->_checkpoint = a7;
  }

  return v18;
}

- (PKPublicChannel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"channel_id"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 objectForKeyedSubscript:@"channel_id"];
  }
  else
  {
    v7 = 0;
  }
  v8 = [v4 objectForKeyedSubscript:@"channel_topic"];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    v10 = [v4 objectForKeyedSubscript:@"channel_topic"];
  }
  else
  {
    v10 = 0;
  }
  v11 = [v4 objectForKeyedSubscript:@"environment"];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if (v12)
  {
    id v13 = [v4 objectForKeyedSubscript:@"environment"];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = [v4 objectForKeyedSubscript:@"token_name"];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    id v16 = [v4 objectForKeyedSubscript:@"token_name"];
  }
  else
  {
    id v16 = 0;
  }
  v17 = [v4 objectForKeyedSubscript:@"checkpoint"];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    objc_super v20 = 0;
LABEL_18:
    NSLog(&cfstr_CouldNotCreate.isa, v4);
    v21 = 0;
    goto LABEL_19;
  }
  v19 = [v4 objectForKeyedSubscript:@"checkpoint"];
  objc_super v20 = v19;
  if (!v7 || !v19) {
    goto LABEL_18;
  }
  self = -[PKPublicChannel initWithChannelID:channelTopic:environment:tokenName:checkpoint:](self, "initWithChannelID:channelTopic:environment:tokenName:checkpoint:", v7, v10, v13, v16, [v19 unsignedLongLongValue]);
  v21 = self;
LABEL_19:

  return v21;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(PKPublicChannel *)self channelID];
  v5 = [(PKPublicChannel *)self channelTopic];
  v6 = [(PKPublicChannel *)self environment];
  v7 = [(PKPublicChannel *)self tokenName];
  v8 = [v3 stringWithFormat:@"<PKGlobalChannel %p>: channelID %@ channelTopic %@ environment %@ tokenName %@ checkpoint %llu", self, v4, v5, v6, v7, -[PKPublicChannel checkpoint](self, "checkpoint")];

  return v8;
}

- (void)setCheckpoint:(unint64_t)a3
{
  if (self->_checkpoint <= a3) {
    self->_checkpoint = a3;
  }
}

- (NSString)tokenName
{
  return (NSString *)@"TokenName";
}

- (unint64_t)hash
{
  v3 = [(PKPublicChannel *)self channelID];
  uint64_t v4 = [v3 hash];
  v5 = [(PKPublicChannel *)self channelTopic];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(PKPublicChannel *)self environment];
  uint64_t v8 = [v7 hash];
  char v9 = [(PKPublicChannel *)self tokenName];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 channelID];
    v7 = [(PKPublicChannel *)self channelID];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [v5 channelTopic];
      char v9 = [(PKPublicChannel *)self channelTopic];
      if ([v8 isEqualToString:v9])
      {
        unint64_t v10 = [v5 environment];
        v11 = [(PKPublicChannel *)self environment];
        if ([v10 isEqualToString:v11])
        {
          [v5 tokenName];
          v12 = id v16 = v10;
          id v13 = [(PKPublicChannel *)self tokenName];
          char v14 = [v12 isEqualToString:v13];

          unint64_t v10 = v16;
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSDictionary)dictionaryRepresentation
{
  v11[5] = *MEMORY[0x263EF8340];
  v10[0] = @"channel_id";
  v3 = [(PKPublicChannel *)self channelID];
  v11[0] = v3;
  v10[1] = @"channel_topic";
  id v4 = [(PKPublicChannel *)self channelTopic];
  v11[1] = v4;
  v10[2] = @"environment";
  id v5 = [(PKPublicChannel *)self environment];
  v11[2] = v5;
  v10[3] = @"token_name";
  uint64_t v6 = [(PKPublicChannel *)self tokenName];
  v11[3] = v6;
  v10[4] = @"checkpoint";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PKPublicChannel checkpoint](self, "checkpoint"));
  v11[4] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

- (void)resetCheckpoint
{
  self->_checkpoint = 0;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
}

- (NSString)channelTopic
{
  return self->_channelTopic;
}

- (void)setChannelTopic:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (unint64_t)checkpoint
{
  return self->_checkpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_channelTopic, 0);
  objc_storeStrong((id *)&self->_channelID, 0);

  objc_storeStrong((id *)&self->_tokenName, 0);
}

@end