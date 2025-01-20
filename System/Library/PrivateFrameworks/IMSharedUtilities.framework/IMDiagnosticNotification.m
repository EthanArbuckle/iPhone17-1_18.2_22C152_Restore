@interface IMDiagnosticNotification
- (BOOL)timeSensitive;
- (IMDiagnosticNotification)init;
- (IMDiagnosticNotification)initWithTitle:(id)a3 body:(id)a4;
- (NSString)body;
- (NSString)identifier;
- (NSString)title;
- (id)_createContent;
- (id)_createRequest;
- (void)setBody:(id)a3;
- (void)setTimeSensitive:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation IMDiagnosticNotification

- (IMDiagnosticNotification)init
{
  v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IMDiagnosticNotification;
    v5 = [(IMDiagnosticNotification *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [NSString stringGUID];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IMDiagnosticNotification)initWithTitle:(id)a3 body:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(IMDiagnosticNotification *)self init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_body, a4);
  }

  return v10;
}

- (id)_createContent
{
  uint64_t v3 = [(IMDiagnosticNotification *)self title];
  if (v3
    && (int v4 = (void *)v3,
        [(IMDiagnosticNotification *)self body],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    uint64_t v6 = (void *)qword_1E94FF860;
    uint64_t v18 = qword_1E94FF860;
    if (!qword_1E94FF860)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_1A083E430;
      v14[3] = &unk_1E5A10130;
      v14[4] = &v15;
      sub_1A083E430((uint64_t)v14);
      uint64_t v6 = (void *)v16[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v15, 8);
    id v8 = objc_alloc_init(v7);
    v9 = [(IMDiagnosticNotification *)self title];
    [v8 setTitle:v9];

    objc_super v10 = [(IMDiagnosticNotification *)self body];
    [v8 setBody:v10];

    [v8 setFooter:@"This is an internal-only notification."];
    v11 = [MEMORY[0x1E4F44610] iconForApplicationIdentifier:@"com.apple.MobileSMS"];
    [v8 setIcon:v11];

    if ([(IMDiagnosticNotification *)self timeSensitive])
    {
      [v8 setShouldIgnoreDowntime:1];
      [v8 setShouldIgnoreDoNotDisturb:1];
    }
    v12 = (void *)[v8 copy];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_createRequest
{
  uint64_t v3 = [(IMDiagnosticNotification *)self _createContent];
  if (v3)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    int v4 = (void *)qword_1E94FF870;
    uint64_t v13 = qword_1E94FF870;
    if (!qword_1E94FF870)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = sub_1A083E5F8;
      v9[3] = &unk_1E5A10130;
      v9[4] = &v10;
      sub_1A083E5F8((uint64_t)v9);
      int v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    uint64_t v6 = [(IMDiagnosticNotification *)self identifier];
    id v7 = [v5 requestWithIdentifier:v6 content:v3 trigger:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (BOOL)timeSensitive
{
  return self->_timeSensitive;
}

- (void)setTimeSensitive:(BOOL)a3
{
  self->_timeSensitive = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end