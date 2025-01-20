@interface MSAccountToEmailProvider
+ (int64_t)accountStatisticsKindToIdentifier:(id)a3;
@end

@implementation MSAccountToEmailProvider

+ (int64_t)accountStatisticsKindToIdentifier:(id)a3
{
  id v3 = a3;
  if (accountStatisticsKindToIdentifier__onceToken != -1) {
    dispatch_once(&accountStatisticsKindToIdentifier__onceToken, &__block_literal_global);
  }
  v4 = [(id)accountStatisticsKindToIdentifier___statisticsKindToAccountTypeMapping objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    int64_t v6 = (int)[v4 intValue];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

void __62__MSAccountToEmailProvider_accountStatisticsKindToIdentifier___block_invoke()
{
  v3[10] = *MEMORY[0x1E4F143B8];
  v2[0] = @"aol";
  v2[1] = @"icloud";
  v3[0] = &unk_1F1AA8F78;
  v3[1] = &unk_1F1AA8F90;
  v2[2] = @"hotmail";
  v2[3] = @"exchange";
  v3[2] = &unk_1F1AA8FA8;
  v3[3] = &unk_1F1AA8FC0;
  v2[4] = @"gmail";
  v2[5] = @"netease";
  v3[4] = &unk_1F1AA8FD8;
  v3[5] = &unk_1F1AA8FF0;
  v2[6] = @"qq";
  v2[7] = @"yahoo";
  v3[6] = &unk_1F1AA9008;
  v3[7] = &unk_1F1AA9020;
  v2[8] = @"imap";
  v2[9] = @"pop";
  v3[8] = &unk_1F1AA9038;
  v3[9] = &unk_1F1AA9050;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:10];
  v1 = (void *)accountStatisticsKindToIdentifier___statisticsKindToAccountTypeMapping;
  accountStatisticsKindToIdentifier___statisticsKindToAccountTypeMapping = v0;
}

@end