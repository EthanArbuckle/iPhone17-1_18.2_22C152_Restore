@interface MPAssistantDislikesMediaEntity
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantDislikesMediaEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = a3;
  requestAceHash = self->_requestAceHash;
  userIdentity = self->_userIdentity;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D4259F6C;
  v8[3] = &unk_1E69E3E40;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  sub_1D4245514(@"Dislikes Media Entity", requestAceHash, 22, userIdentity, v8);
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    v5 = [(MPAssistantDislikesMediaEntity *)self aceId];
    sub_1D4244ECC(@"Dislikes Media Entity", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v17 = v9;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Dislikes Media Entity (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  v10 = self->_requestAceHash;
  v11 = [(SAMPDislikesMediaEntity *)self influencedUserSharedUserId];
  v12 = [(SAMPDislikesMediaEntity *)self influencedUserSharedUserId];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1D425A248;
  v14[3] = &unk_1E69E3F08;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  sub_1D4246230(@"Dislikes Media Entity", v10, v11, v12, v14);
}

@end