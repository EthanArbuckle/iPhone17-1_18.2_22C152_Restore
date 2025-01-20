@interface HKCDADocumentShareItemSource
- (HKCDADocumentSample)documentSample;
- (HKCDADocumentShareItemSource)initWithDocumentSample:(id)a3 healthStore:(id)a4;
- (HKCDAPDFGenerator)generator;
- (HKHealthStore)healthStore;
- (NSData)shareData;
- (NSURL)exportArchiveURL;
- (id)_simpleError:(id)a3;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)item;
- (void)_buildZipArchiveWithCDA:(id)a3 generatedPDF:(id)a4 completion:(id)a5;
- (void)_generatePDFforCDA:(id)a3 completion:(id)a4;
- (void)_loadShareDataWithHealthStore:(id)a3 completion:(id)a4;
- (void)dealloc;
@end

@implementation HKCDADocumentShareItemSource

- (HKCDADocumentShareItemSource)initWithDocumentSample:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = NSString;
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"CDA_EXPORT_ARCHIVE_FOLDER_NAME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v12 = [v9 stringWithFormat:@"http://localhost/%@.zip", v11];

  v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
  v25.receiver = self;
  v25.super_class = (Class)HKCDADocumentShareItemSource;
  v14 = [(UIActivityItemProvider *)&v25 initWithPlaceholderItem:v13];
  v15 = v14;
  if (v14)
  {
    p_documentSample = (id *)&v14->_documentSample;
    objc_storeStrong((id *)&v14->_documentSample, a3);
    objc_storeStrong((id *)&v15->_healthStore, a4);
    v17 = [*p_documentSample document];

    if (v17)
    {
      v18 = [*p_documentSample document];
      uint64_t v19 = [v18 documentData];
      shareData = v15->_shareData;
      v15->_shareData = (NSData *)v19;
    }
    else
    {
      v18 = v15->_shareData;
      v15->_shareData = 0;
    }

    v21 = objc_alloc_init(HKCDAPDFGenerator);
    generator = v15->_generator;
    v15->_generator = v21;

    exportArchiveURL = v15->_exportArchiveURL;
    v15->_exportArchiveURL = 0;
  }
  return v15;
}

- (void)dealloc
{
  if (self->_exportArchiveURL)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [(NSURL *)self->_exportArchiveURL path];
    [v3 removeItemAtPath:v4 error:0];
    v5 = [v4 stringByDeletingLastPathComponent];
    [v3 removeItemAtPath:v5 error:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)HKCDADocumentShareItemSource;
  [(HKCDADocumentShareItemSource *)&v6 dealloc];
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return @"com.pkware.zip-archive";
}

- (id)_simpleError:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  objc_super v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ExportHealthReport" code:100 userInfo:v5];

  return v6;
}

- (void)_buildZipArchiveWithCDA:(id)a3 generatedPDF:(id)a4 completion:(id)a5
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  v11 = NSTemporaryDirectory();
  v44[0] = v11;
  v44[1] = @"ccd_export_dir_XXXXXX";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];

  id v13 = [NSString pathWithComponents:v12];
  strncpy(__dst, (const char *)[v13 UTF8String], 0x400uLL);
  __dst[1023] = 0;
  v14 = mkdtemp(__dst);
  if (v14)
  {
    id v41 = v13;
    uint64_t v15 = [NSString stringWithUTF8String:v14];
    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = [v16 localizedStringForKey:@"CDA_EXPORT_ARCHIVE_FOLDER_NAME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v40 = (void *)v15;
    v42[0] = v15;
    v18 = [NSString stringWithFormat:@"%@.zip", v17];
    v42[1] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];

    v39 = [NSString pathWithComponents:v19];
    objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
    v20 = (NSURL *)objc_claimAutoreleasedReturnValue();
    exportArchiveURL = self->_exportArchiveURL;
    self->_exportArchiveURL = v20;

    v22 = (void *)[objc_alloc(MEMORY[0x1E4F2B850]) initWithURL:self->_exportArchiveURL archiveType:0];
    if ([v22 archiveIsValid])
    {
      v37 = v19;
      [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v36 = v9;
      v24 = id v23 = v8;
      objc_super v25 = [v24 localizedStringForKey:@"CDA_EXPORT_FILE_NAME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

      v26 = [NSString stringWithFormat:@"%@/%@", v17, v25];
      v27 = (void *)MEMORY[0x1E4F1CB10];
      v28 = [v26 stringByAppendingString:@".xml"];
      v29 = [v27 fileURLWithPath:v28];
      v38 = v23;
      id v30 = v23;
      id v9 = v36;
      [v22 addDataToArchive:v30 pathInArchive:v29];

      v31 = (void *)MEMORY[0x1E4F1CB10];
      v32 = [v26 stringByAppendingString:@".pdf"];
      v33 = [v31 fileURLWithPath:v32];
      [v22 addFileToArchive:v36 pathInArchive:v33];

      if ([v22 archiveIsValid])
      {
        [v22 closeArchive];
        v10[2](v10, 1, 0);
      }
      else
      {
        v35 = [(HKCDADocumentShareItemSource *)self _simpleError:@"Unable to add files to archive for Clinical Document export"];
        ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v35);
      }
      id v8 = v38;
      uint64_t v19 = v37;
    }
    else
    {
      objc_super v25 = [(HKCDADocumentShareItemSource *)self _simpleError:@"Unable to create archive for Clinical Document export."];
      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v25);
    }

    v34 = v40;
    id v13 = v41;
  }
  else
  {
    v34 = [(HKCDADocumentShareItemSource *)self _simpleError:@"Unable to create temporary directory for exported Health Report."];
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v34);
  }
}

- (void)_generatePDFforCDA:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  generator = self->_generator;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__HKCDADocumentShareItemSource__generatePDFforCDA_completion___block_invoke;
  v11[3] = &unk_1E6D56330;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(HKCDAPDFGenerator *)generator generatePDFForCDAXML:v10 completionHandler:v11];
}

uint64_t __62__HKCDADocumentShareItemSource__generatePDFforCDA_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    return [*(id *)(a1 + 32) _buildZipArchiveWithCDA:*(void *)(a1 + 40) generatedPDF:a3 completion:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_loadShareDataWithHealthStore:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  shareData = self->_shareData;
  if (shareData)
  {
    [(HKCDADocumentShareItemSource *)self _generatePDFforCDA:shareData completion:v6];
  }
  else
  {
    documentSample = self->_documentSample;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__HKCDADocumentShareItemSource__loadShareDataWithHealthStore_completion___block_invoke;
    v10[3] = &unk_1E6D56358;
    v10[4] = self;
    id v11 = v6;
    [(HKCDADocumentSample *)documentSample fetchDetailedReportWithHealthStore:a3 reportDataBlock:v10];
  }
}

void __73__HKCDADocumentShareItemSource__loadShareDataWithHealthStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 288), a2);
    [*(id *)(a1 + 32) _generatePDFforCDA:v4 completion:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)item
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  healthStore = self->_healthStore;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __36__HKCDADocumentShareItemSource_item__block_invoke;
  id v12 = &unk_1E6D533F0;
  v14 = &v15;
  v5 = v3;
  id v13 = v5;
  [(HKCDADocumentShareItemSource *)self _loadShareDataWithHealthStore:healthStore completion:&v9];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v16 + 24))
  {
    id v6 = self->_exportArchiveURL;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", &stru_1F3B9CF20, v9, v10, v11, v12);
    id v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  _Block_object_dispose(&v15, 8);
  return v7;
}

intptr_t __36__HKCDADocumentShareItemSource_item__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (HKCDADocumentSample)documentSample
{
  return self->_documentSample;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NSData)shareData
{
  return self->_shareData;
}

- (HKCDAPDFGenerator)generator
{
  return self->_generator;
}

- (NSURL)exportArchiveURL
{
  return self->_exportArchiveURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportArchiveURL, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_shareData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_documentSample, 0);
}

@end