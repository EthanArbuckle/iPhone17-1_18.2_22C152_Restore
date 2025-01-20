@interface MPAssistantGeniusSummon
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantGeniusSummon

- (void).cxx_destruct
{
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F967E8];
  v5 = (void (**)(id, void *))a3;
  v6 = (void *)[[v4 alloc] initWithReason:@"Unsupported Feature"];
  if (![(NSString *)self->_requestAceHash length])
  {
    v7 = [(MPAssistantGeniusSummon *)self aceId];
    sub_1D4244ECC(@"Genius Summon", v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v8;
  }
  v10 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = self->_requestAceHash;
    v12 = [v6 dictionary];
    int v14 = 138543618;
    v15 = v11;
    __int16 v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_1D422A000, v10, OS_LOG_TYPE_ERROR, "Genius Summon (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v14, 0x16u);
  }
  v13 = [v6 dictionary];
  v5[2](v5, v13);
}

@end