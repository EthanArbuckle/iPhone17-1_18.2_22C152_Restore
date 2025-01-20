@interface ATXBestTimeToInteractWithContactDataSource
- (ATXBestTimeToInteractWithContactDataSource)initWithDevice:(id)a3;
- (void)hourOfDayInteractionProbabilitiesWithContact:(id)a3 callback:(id)a4;
@end

@implementation ATXBestTimeToInteractWithContactDataSource

- (ATXBestTimeToInteractWithContactDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXBestTimeToInteractWithContactDataSource;
  v6 = [(ATXBestTimeToInteractWithContactDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)hourOfDayInteractionProbabilitiesWithContact:(id)a3 callback:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *, void))a4;
  if (ATXHeuristicCanLearnFromApp(&unk_1F27272D8))
  {
    v7 = objc_opt_new();
    v12[0] = v5;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    objc_super v9 = [v7 hourOfDayProbabilitiesToInteractWithContacts:v8];

    v10 = [v9 allValues];
    v11 = [v10 firstObject];
    v6[2](v6, v11, 0);
  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E4F1CC08], 0);
  }
}

- (void).cxx_destruct
{
}

@end