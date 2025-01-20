@interface CNPRSPosterArchiver
+ (id)archiveCNConfiguration:(id)a3 error:(id *)a4;
+ (id)unarchiveCNConfigurationAtURL:(id)a3 error:(id *)a4;
+ (id)unarchiveCNConfigurationFromData:(id)a3 error:(id *)a4;
@end

@implementation CNPRSPosterArchiver

+ (id)unarchiveCNConfigurationFromData:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A268] + 16))())
  {
    v6 = CNUILogPosters();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "Failed to unarchive configuration, poster data is empty", buf, 2u);
    }
    v7 = 0;
  }
  else
  {
    id v12 = 0;
    v8 = [(Class)getPRSPosterArchiverClass[0]() unarchiveConfigurationFromData:v5 format:-1 error:&v12];
    v6 = v12;
    if (v8)
    {
      v7 = [[CNPRSPosterConfiguration alloc] initWithPosterConfiguration:v8];
    }
    else
    {
      v9 = CNUILogPosters();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = [v6 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "PRSPosterArchiver failed to unarchive configuration, %@", buf, 0xCu);
      }
      v7 = 0;
      if (a4) {
        *a4 = v6;
      }
    }
  }

  return v7;
}

+ (id)unarchiveCNConfigurationAtURL:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = getPRSPosterArchiverClass[0];
  id v6 = a3;
  id v13 = 0;
  v7 = [(id)v5() unarchiveConfigurationAtURL:v6 format:-1 error:&v13];

  id v8 = v13;
  if (v7)
  {
    v9 = [[CNPRSPosterConfiguration alloc] initWithPosterConfiguration:v7];
  }
  else
  {
    v10 = CNUILogPosters();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v8 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v12;
      _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, "PRSPosterArchiver failed to unarchive configuration, %@", buf, 0xCu);
    }
    v9 = 0;
    if (a4) {
      *a4 = v8;
    }
  }

  return v9;
}

+ (id)archiveCNConfiguration:(id)a3 error:(id *)a4
{
  id v5 = getPRSPosterArchiverClass[0];
  id v6 = a3;
  v7 = (void *)v5();
  id v8 = [v6 wrappedPosterConfiguration];

  v9 = [v7 archiveConfiguration:v8 format:1 error:a4];

  return v9;
}

@end