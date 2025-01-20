@interface IMCTChatBotCache
- (_TtC17IMSharedUtilities16IMCTChatBotCache)init;
- (void)destinationCapabilitiesUpdated:(id)a3 withCapabilities:(id)a4;
- (void)didDiscover:(id)a3 destination:(id)a4 withCapabilities:(id)a5 withResult:(id)a6;
- (void)didFinishFetchChatBotRenderInformation:(id)a3 forChatBot:(id)a4 withRenderData:(id)a5 withResult:(id)a6;
@end

@implementation IMCTChatBotCache

- (_TtC17IMSharedUtilities16IMCTChatBotCache)init
{
  return (_TtC17IMSharedUtilities16IMCTChatBotCache *)sub_1A0792998();
}

- (void)destinationCapabilitiesUpdated:(id)a3 withCapabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = objc_msgSend(v7, sel_discovered);
  objc_msgSend(v7, sel_isBot);
  v10 = *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC17IMSharedUtilities16IMCTChatBotCache_cache);
  v11 = (void *)sub_1A09F40F8();
  id v12 = objc_msgSend(v9, sel_uri);
  if (v12)
  {
    id v13 = v12;
    objc_msgSend(v10, sel_setObject_forKey_, v11);
  }
  else
  {
    __break(1u);
  }
}

- (void)didDiscover:(id)a3 destination:(id)a4 withCapabilities:(id)a5 withResult:(id)a6
{
  if (a5)
  {
    id v10 = a5;
    id v11 = a3;
    id v12 = a4;
    id v13 = a6;
    v14 = self;
    objc_msgSend(v10, sel_isBot);
    v15 = *(Class *)((char *)&v14->super.isa + OBJC_IVAR____TtC17IMSharedUtilities16IMCTChatBotCache_cache);
    v16 = (void *)sub_1A09F40F8();
    id v17 = objc_msgSend(v12, sel_uri);
    if (v17)
    {
      id v18 = v17;
      objc_msgSend(v15, sel_setObject_forKey_, v16);
    }
    else
    {
      __break(1u);
    }
  }
}

- (void)didFinishFetchChatBotRenderInformation:(id)a3 forChatBot:(id)a4 withRenderData:(id)a5 withResult:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_1A08D7064(v11, a5);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17IMSharedUtilities16IMCTChatBotCache_client);
}

@end