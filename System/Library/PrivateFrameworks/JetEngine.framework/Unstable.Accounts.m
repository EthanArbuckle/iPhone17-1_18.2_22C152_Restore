@interface Unstable.Accounts
- (void)accountCookiesDidChange:(id)a3;
- (void)accountStoreDidChange:(id)a3;
@end

@implementation Unstable.Accounts

- (void)accountCookiesDidChange:(id)a3
{
  uint64_t v4 = sub_19F1DAEBC();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19F1DAE8C();
  v8 = *(void **)self->accountsLock;
  swift_retain();
  objc_msgSend(v8, sel_lock);
  id v9 = objc_msgSend(*(id *)self->backingStore, sel_ams_activeiTunesAccount);
  v10 = *(void **)self->unlockedActiveiTunesAccount;
  *(void *)self->unlockedActiveiTunesAccount = v9;

  objc_msgSend(v8, sel_unlock);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)accountStoreDidChange:(id)a3
{
  uint64_t v3 = sub_19F1DAEBC();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19F1DAE8C();
  swift_retain();
  sub_19F0A26A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end