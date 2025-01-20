@interface ASCABLEAuthenticator.APSWrapper
- (_TtCC26AuthenticationServicesCore20ASCABLEAuthenticatorP33_84AFAA0745E7F5997DD6543D9C2808DD10APSWrapper)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation ASCABLEAuthenticator.APSWrapper

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    uint64_t v9 = sub_2193E2130();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    v13 = self;
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  if (qword_26AC26F98 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_2193E24F0();
  __swift_project_value_buffer(v14, (uint64_t)qword_26AC29118);
  v15 = sub_2193E24D0();
  os_log_type_t v16 = sub_2193E2AC0();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_219326000, v15, v16, "Received public push token", v17, 2u);
    MEMORY[0x21D48A390](v17, -1, -1);
  }

  sub_21934CEB0(v9, v11);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_21935EB78(a4);
}

- (_TtCC26AuthenticationServicesCore20ASCABLEAuthenticatorP33_84AFAA0745E7F5997DD6543D9C2808DD10APSWrapper)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ASCABLEAuthenticator.APSWrapper();
  return [(ASCABLEAuthenticator.APSWrapper *)&v4 init];
}

- (void).cxx_destruct
{
}

@end