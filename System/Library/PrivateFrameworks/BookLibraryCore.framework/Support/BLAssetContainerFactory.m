@interface BLAssetContainerFactory
+ (id)assetContainerForDownloadKind:(id)a3 isPermlink:(BOOL)a4;
+ (void)_overrideAssetContainersForTestingWithEbookAssetContainer:(id)a3 audiobookAssetContainer:(id)a4 pdfAssetContainer:(id)a5;
+ (void)setMetadataStoreManager:(id)a3;
@end

@implementation BLAssetContainerFactory

+ (void)_overrideAssetContainersForTestingWithEbookAssetContainer:(id)a3 audiobookAssetContainer:(id)a4 pdfAssetContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 assetContainerForDownloadKind:&stru_1001ABB60 isPermlink:0];
  v12 = (void *)qword_1001C8108;
  qword_1001C8108 = (uint64_t)v8;
  id v16 = v8;

  v13 = (void *)qword_1001C8118;
  qword_1001C8118 = (uint64_t)v9;
  id v14 = v9;

  v15 = (void *)qword_1001C8120;
  qword_1001C8120 = (uint64_t)v10;
}

+ (void)setMetadataStoreManager:(id)a3
{
}

+ (id)assetContainerForDownloadKind:(id)a3 isPermlink:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (qword_1001C8128 != -1) {
    dispatch_once(&qword_1001C8128, &stru_1001A1258);
  }
  if ([BLDownloadKindEBook isEqual:v5]) {
    goto LABEL_4;
  }
  if ([BLDownloadKindAudiobook isEqual:v5])
  {
    v6 = (void *)qword_1001C8118;
    goto LABEL_9;
  }
  if ([BLDownloadKindPDF isEqual:v5])
  {
    v6 = (void *)qword_1001C8120;
    goto LABEL_9;
  }
  id v9 = BLUtilitiesLog();
  id v10 = v9;
  if (v4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[BLAssetContainerFactory] Permalink download, returning epub asset container.", (uint8_t *)&v11, 2u);
    }

LABEL_4:
    v6 = (void *)qword_1001C8108;
LABEL_9:
    id v7 = v6;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[BLAssetContainerFactory] unexpected download kind \"%@\", returning nil asset container.", (uint8_t *)&v11, 0xCu);
  }

  id v7 = 0;
LABEL_10:

  return v7;
}

@end