@interface BLTLightsAndSirensReplyInfo
- (BLTLightsAndSirensReplyInfo)init;
- (BOOL)didLogAggd;
- (BOOL)hasExpired;
- (BOOL)replySent;
- (BOOL)sendReply;
- (NSDate)bulletinPublicationDate;
- (NSDate)creation;
- (NSString)publisherMatchID;
- (NSString)sectionID;
- (id)reply;
- (unint64_t)didPlayLightsAndSirens;
- (void)setBulletinPublicationDate:(id)a3;
- (void)setDidLogAggd:(BOOL)a3;
- (void)setDidPlayLightsAndSirens:(unint64_t)a3;
- (void)setPublisherMatchID:(id)a3;
- (void)setReply:(id)a3;
- (void)setSectionID:(id)a3;
@end

@implementation BLTLightsAndSirensReplyInfo

- (BLTLightsAndSirensReplyInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLTLightsAndSirensReplyInfo;
  v2 = [(BLTLightsAndSirensReplyInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    creation = v2->_creation;
    v2->_creation = (NSDate *)v3;

    v2->_didPlayLightsAndSirens = 0;
  }
  return v2;
}

- (BOOL)hasExpired
{
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  v4 = [(BLTLightsAndSirensReplyInfo *)self creation];
  [v3 timeIntervalSinceDate:v4];
  BOOL v6 = v5 >= 7200.0;

  return v6;
}

- (BOOL)sendReply
{
  if (self->_replySent)
  {
    LOBYTE(reply) = 1;
  }
  else
  {
    unint64_t didPlayLightsAndSirens = self->_didPlayLightsAndSirens;
    if (didPlayLightsAndSirens)
    {
      reply = (void (**)(id, BOOL))self->_reply;
      if (reply)
      {
        reply[2](reply, didPlayLightsAndSirens == 1);
        LOBYTE(reply) = 1;
        self->_replySent = 1;
      }
    }
    else
    {
      LOBYTE(reply) = 0;
    }
  }
  return (char)reply;
}

- (BOOL)replySent
{
  return self->_replySent;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (unint64_t)didPlayLightsAndSirens
{
  return self->_didPlayLightsAndSirens;
}

- (void)setDidPlayLightsAndSirens:(unint64_t)a3
{
  self->_unint64_t didPlayLightsAndSirens = a3;
}

- (NSDate)bulletinPublicationDate
{
  return self->_bulletinPublicationDate;
}

- (void)setBulletinPublicationDate:(id)a3
{
}

- (BOOL)didLogAggd
{
  return self->_didLogAggd;
}

- (void)setDidLogAggd:(BOOL)a3
{
  self->_didLogAggd = a3;
}

- (NSDate)creation
{
  return self->_creation;
}

- (NSString)publisherMatchID
{
  return self->_publisherMatchID;
}

- (void)setPublisherMatchID:(id)a3
{
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_publisherMatchID, 0);
  objc_storeStrong((id *)&self->_creation, 0);
  objc_storeStrong((id *)&self->_bulletinPublicationDate, 0);
  objc_storeStrong(&self->_reply, 0);
}

@end