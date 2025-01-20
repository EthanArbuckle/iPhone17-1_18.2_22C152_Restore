@interface CNUIGeminiDataSource
- (CNContact)contact;
- (CNGeminiManager)geminiManager;
- (CNGeminiResult)geminiResult;
- (CNUIGeminiDataSource)initWithGeminiManager:(id)a3;
- (CNUIGeminiDataSourceDelegate)delegate;
- (NSString)channelIdentifier;
- (void)applicationWillEnterForeground:(id)a3;
- (void)channelsDidChangeForGeminiManager:(id)a3;
- (void)resetDataSource;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGeminiManager:(id)a3;
- (void)setGeminiResult:(id)a3;
@end

@implementation CNUIGeminiDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_geminiResult, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setGeminiManager:(id)a3
{
}

- (CNGeminiManager)geminiManager
{
  return self->_geminiManager;
}

- (void)setDelegate:(id)a3
{
}

- (CNUIGeminiDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNUIGeminiDataSourceDelegate *)WeakRetained;
}

- (void)setGeminiResult:(id)a3
{
}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)channelsDidChangeForGeminiManager:(id)a3
{
  v4 = [(CNUIGeminiDataSource *)self geminiManager];
  v5 = [(CNUIGeminiDataSource *)self contact];
  v6 = [v4 remoteGeminiResultForContact:v5 substituteDefaultForDangling:0 error:0];
  [(CNUIGeminiDataSource *)self setGeminiResult:v6];

  id v7 = [(CNUIGeminiDataSource *)self delegate];
  [v7 geminiDataSourceDidUpdate:self];
}

- (NSString)channelIdentifier
{
  v2 = [(CNUIGeminiDataSource *)self geminiResult];
  v3 = [v2 channel];
  v4 = [v3 channelIdentifier];

  return (NSString *)v4;
}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F5A298];
  v5 = [(CNUIGeminiDataSource *)self contact];
  v6 = [v5 preferredChannel];
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  if (v4)
  {
    id v7 = [(CNUIGeminiDataSource *)self geminiManager];
    [(CNUIGeminiDataSource *)self channelsDidChangeForGeminiManager:v7];
  }
}

- (void)setContact:(id)a3
{
  id v11 = a3;
  v5 = [(CNContact *)self->_contact identifier];
  v6 = [v11 identifier];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    v8 = [(CNUIGeminiDataSource *)self geminiManager];
    v9 = [v8 remoteGeminiResultForContact:v11 substituteDefaultForDangling:0 error:0];
    [(CNUIGeminiDataSource *)self setGeminiResult:v9];

    v10 = [(CNUIGeminiDataSource *)self delegate];
    [v10 geminiDataSourceDidUpdate:self];
  }
}

- (void)resetDataSource
{
  contact = self->_contact;
  self->_contact = 0;

  geminiResult = self->_geminiResult;
  self->_geminiResult = 0;
}

- (CNUIGeminiDataSource)initWithGeminiManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNUIGeminiDataSource;
  v6 = [(CNUIGeminiDataSource *)&v11 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geminiManager, a3);
    [v5 addDelegate:v7 queue:0];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];

    v9 = v7;
  }

  return v7;
}

@end