@interface WFWordPressSessionManager
- (NSNumber)blogId;
- (NSString)password;
- (NSString)username;
- (NSURL)endpointURL;
- (NSURLSession)session;
- (WFWordPressSessionManager)init;
- (WFWordPressSessionManager)initWithSessionConfiguration:(id)a3;
- (void)createPostWithContent:(id)a3 completionHandler:(id)a4;
- (void)createPostWithTitle:(id)a3 content:(id)a4 type:(id)a5 date:(id)a6 format:(id)a7 status:(id)a8 allowingComments:(BOOL)a9 name:(id)a10 excerpt:(id)a11 template:(id)a12 tags:(id)a13 categories:(id)a14 thumbnailId:(id)a15 customFields:(id)a16 completionHandler:(id)a17;
- (void)getBlogsWithCompletionHandler:(id)a3;
- (void)getPageTemplatesWithCompletionHandler:(id)a3;
- (void)getPost:(id)a3 completionHandler:(id)a4;
- (void)getPostFormatsWithCompletionHandler:(id)a3;
- (void)getPostStatusesWithCompletionHandler:(id)a3;
- (void)getPostTypesWithCompletionHandler:(id)a3;
- (void)getTermsForTaxonomy:(id)a3 completionHandler:(id)a4;
- (void)sendRequest:(id)a3 completionHandler:(id)a4;
- (void)sendRequestWithMethod:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
- (void)setBlogId:(id)a3;
- (void)setEndpointURL:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
- (void)uploadFile:(id)a3 completionHandler:(id)a4;
@end

@implementation WFWordPressSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_blogId, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setBlogId:(id)a3
{
}

- (NSNumber)blogId
{
  return self->_blogId;
}

- (void)setEndpointURL:(id)a3
{
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setPassword:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFWordPressSessionManager *)self session];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__WFWordPressSessionManager_sendRequest_completionHandler___block_invoke;
  v11[3] = &unk_264E5EC38;
  id v12 = v6;
  id v9 = v6;
  v10 = [v8 dataTaskWithRequest:v7 completionHandler:v11];

  [v10 resume];
}

void __59__WFWordPressSessionManager_sendRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v35[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 200, 100);
  uint64_t v11 = [v8 statusCode];
  if ([v7 length] && (char v12 = objc_msgSend(v10, "containsIndex:", v11), !v9) && (v12 & 1) != 0)
  {
    v13 = [[WPXMLRPCDecoder alloc] initWithData:v7];
    v14 = [(WPXMLRPCDecoder *)v13 object];
    id v9 = [(WPXMLRPCDecoder *)v13 error];

    if (v9)
    {
      id v9 = [(WPXMLRPCDecoder *)v13 error];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
      v16 = [v15 objectForKeyedSubscript:@"faultCode"];

      if (v16)
      {
        v17 = objc_opt_new();
        v18 = [v15 objectForKeyedSubscript:@"faultString"];
        [v17 setValue:v18 forKey:*MEMORY[0x263F08320]];

        v19 = (void *)MEMORY[0x263F087E8];
        v20 = [v15 objectForKeyedSubscript:@"faultCode"];
        uint64_t v21 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", @"WFWordPressErrorDomain", objc_msgSend(v20, "integerValue"), v17);

        v14 = 0;
        id v9 = (id)v21;
      }
      else
      {
        v14 = v15;
      }
    }
    uint64_t v31 = *(void *)(a1 + 32);
    if (v31) {
      (*(void (**)(uint64_t, void *, id))(v31 + 16))(v31, v14, v9);
    }
  }
  else
  {
    if (!v9)
    {
      uint64_t v22 = [v8 statusCode];
      v23 = (void *)MEMORY[0x263F087E8];
      if (v22 == 404)
      {
        uint64_t v34 = *MEMORY[0x263F08320];
        v24 = WFLocalizedString(@"The specified blog URL was invalid.");
        v35[0] = v24;
        v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
        id v9 = [v23 errorWithDomain:@"WFWordPressErrorDomain" code:1 userInfo:v25];
      }
      else
      {
        uint64_t v26 = *MEMORY[0x263F08570];
        uint64_t v32 = *MEMORY[0x263F08320];
        v27 = NSString;
        v24 = WFLocalizedString(@"The WordPress request failed (%@).");
        v25 = [MEMORY[0x263EFC5E0] localizedStringForStatusCode:v11];
        v28 = objc_msgSend(v27, "stringWithFormat:", v24, v25, v32);
        v33 = v28;
        v29 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        id v9 = [v23 errorWithDomain:v26 code:-1 userInfo:v29];
      }
    }
    uint64_t v30 = *(void *)(a1 + 32);
    if (v30) {
      (*(void (**)(uint64_t, void, id))(v30 + 16))(v30, 0, v9);
    }
  }
}

- (void)sendRequestWithMethod:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  id v8 = (void (**)(id, void, id))a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[WPXMLRPCEncoder alloc] initWithMethod:v10 andParameters:v9];

  id v17 = 0;
  char v12 = [(WPXMLRPCEncoder *)v11 dataEncodedWithError:&v17];
  id v13 = v17;
  if (v13)
  {
    if (v8) {
      v8[2](v8, 0, v13);
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x263EFC5E8];
    id v15 = [(WFWordPressSessionManager *)self endpointURL];
    v16 = [v14 requestWithURL:v15];

    [v16 _setNonAppInitiated:1];
    [v16 setHTTPMethod:@"POST"];
    [v16 setHTTPBody:v12];
    [v16 setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    [(WFWordPressSessionManager *)self sendRequest:v16 completionHandler:v8];
  }
}

- (void)uploadFile:(id)a3 completionHandler:(id)a4
{
  v50[3] = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void, id))a4;
  id v7 = a3;
  id v8 = [v7 inputStream];
  v49[0] = @"name";
  id v9 = [v7 filename];
  v50[0] = v9;
  v49[1] = @"type";
  id v10 = [v7 wfType];

  uint64_t v11 = [v10 MIMEType];
  v49[2] = @"bits";
  v50[1] = v11;
  v50[2] = v8;
  char v12 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];

  uint64_t v13 = [(WFWordPressSessionManager *)self blogId];
  v14 = (void *)v13;
  id v15 = &unk_26F074B68;
  if (v13) {
    id v15 = (void *)v13;
  }
  v48[0] = v15;
  uint64_t v16 = [(WFWordPressSessionManager *)self username];
  id v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = &stru_26F008428;
  }
  v48[1] = v18;
  uint64_t v19 = [(WFWordPressSessionManager *)self password];
  v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (__CFString *)v19;
  }
  else {
    uint64_t v21 = &stru_26F008428;
  }
  v48[2] = v21;
  v48[3] = v12;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];

  v23 = [[WPXMLRPCEncoder alloc] initWithMethod:@"wp.uploadFile" andParameters:v22];
  v24 = (void *)MEMORY[0x263F339A0];
  v25 = [MEMORY[0x263F08C38] UUID];
  uint64_t v26 = [v25 UUIDString];
  v27 = [v24 createTemporaryFileWithFilename:v26];

  v28 = [v27 path];
  id v47 = 0;
  [(WPXMLRPCEncoder *)v23 encodeToFile:v28 error:&v47];
  id v29 = v47;

  if (v29)
  {
    v6[2](v6, 0, v29);
  }
  else
  {
    uint64_t v30 = [MEMORY[0x263F08850] defaultManager];
    [v27 path];
    uint64_t v31 = v43 = v8;
    id v46 = 0;
    [v30 attributesOfItemAtPath:v31 error:&v46];
    uint64_t v32 = v42 = v22;
    id v29 = v46;
    [v32 objectForKey:*MEMORY[0x263F080B8]];
    v33 = v41 = v23;

    uint64_t v34 = [MEMORY[0x263EFF950] inputStreamWithURL:v27];
    v35 = (void *)MEMORY[0x263EFC5E8];
    [(WFWordPressSessionManager *)self endpointURL];
    v36 = v6;
    v38 = v37 = v12;
    v39 = [v35 requestWithURL:v38];

    char v12 = v37;
    id v6 = v36;
    [v39 _setNonAppInitiated:1];
    [v39 setHTTPMethod:@"POST"];
    [v39 setHTTPBodyStream:v34];
    [v39 setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    v40 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v33, "unsignedLongLongValue"));
    [v39 setValue:v40 forHTTPHeaderField:@"Content-Length"];

    uint64_t v22 = v42;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __58__WFWordPressSessionManager_uploadFile_completionHandler___block_invoke;
    v44[3] = &unk_264E5A4C0;
    v45 = v36;
    [(WFWordPressSessionManager *)self sendRequest:v39 completionHandler:v44];

    id v8 = v43;
    v23 = v41;
  }
}

void __58__WFWordPressSessionManager_uploadFile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = 0;
    id v8 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v9];
    id v7 = v9;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getPost:(id)a3 completionHandler:(id)a4
{
  v22[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(WFWordPressSessionManager *)self blogId];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = &unk_26F074B68;
  }
  v22[0] = v10;
  uint64_t v11 = [(WFWordPressSessionManager *)self username];
  char v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_26F008428;
  }
  v22[1] = v13;
  uint64_t v14 = [(WFWordPressSessionManager *)self password];
  id v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  else {
    uint64_t v16 = &stru_26F008428;
  }
  if (v7) {
    id v17 = v7;
  }
  else {
    id v17 = &unk_26F074B68;
  }
  v22[2] = v16;
  v22[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __55__WFWordPressSessionManager_getPost_completionHandler___block_invoke;
  v20[3] = &unk_264E5A4C0;
  id v21 = v6;
  id v19 = v6;
  [(WFWordPressSessionManager *)self sendRequestWithMethod:@"wp.getPost" parameters:v18 completionHandler:v20];
}

void __55__WFWordPressSessionManager_getPost_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v9];
    id v7 = v9;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createPostWithContent:(id)a3 completionHandler:(id)a4
{
  v22[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(WFWordPressSessionManager *)self blogId];
  id v9 = (void *)v8;
  id v10 = &unk_26F074B68;
  if (v8) {
    id v10 = (void *)v8;
  }
  v22[0] = v10;
  uint64_t v11 = [(WFWordPressSessionManager *)self username];
  char v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_26F008428;
  }
  v22[1] = v13;
  uint64_t v14 = [(WFWordPressSessionManager *)self password];
  id v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  else {
    uint64_t v16 = &stru_26F008428;
  }
  id v17 = (id)MEMORY[0x263EFFA78];
  if (v7) {
    id v17 = v7;
  }
  v22[2] = v16;
  v22[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__WFWordPressSessionManager_createPostWithContent_completionHandler___block_invoke;
  v20[3] = &unk_264E5A4C0;
  id v21 = v6;
  id v19 = v6;
  [(WFWordPressSessionManager *)self sendRequestWithMethod:@"wp.newPost" parameters:v18 completionHandler:v20];
}

void __69__WFWordPressSessionManager_createPostWithContent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerValue"));
    }
    else
    {
      id v6 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createPostWithTitle:(id)a3 content:(id)a4 type:(id)a5 date:(id)a6 format:(id)a7 status:(id)a8 allowingComments:(BOOL)a9 name:(id)a10 excerpt:(id)a11 template:(id)a12 tags:(id)a13 categories:(id)a14 thumbnailId:(id)a15 customFields:(id)a16 completionHandler:(id)a17
{
  id v45 = a17;
  id v38 = a16;
  id v44 = a15;
  id v21 = a14;
  id v43 = a12;
  id v42 = a11;
  id v41 = a10;
  id v40 = a8;
  id v39 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  uint64_t v26 = objc_msgSend(a13, "if_compactMap:", &__block_literal_global_7723);
  v27 = objc_msgSend(v21, "if_compactMap:", &__block_literal_global_205);

  v28 = objc_opt_new();
  if ([v26 count]) {
    id v29 = v26;
  }
  else {
    id v29 = 0;
  }
  [v28 setValue:v29 forKey:@"post_tag"];
  if ([v27 count]) {
    uint64_t v30 = v27;
  }
  else {
    uint64_t v30 = 0;
  }
  [v28 setValue:v30 forKey:@"category"];
  uint64_t v31 = objc_opt_new();
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __179__WFWordPressSessionManager_createPostWithTitle_content_type_date_format_status_allowingComments_name_excerpt_template_tags_categories_thumbnailId_customFields_completionHandler___block_invoke_3;
  v47[3] = &unk_264E57978;
  id v48 = v31;
  id v32 = v31;
  [v38 enumerateKeysAndObjectsUsingBlock:v47];

  v33 = objc_opt_new();
  [v33 setValue:v25 forKey:@"post_title"];

  [v33 setValue:v24 forKey:@"post_content"];
  uint64_t v34 = [v23 name];

  [v33 setValue:v34 forKey:@"post_type"];
  [v33 setValue:v22 forKey:@"post_date_gmt"];

  [v33 setValue:v39 forKey:@"post_format"];
  [v33 setValue:v40 forKey:@"post_status"];

  [v33 setValue:v41 forKey:@"post_name"];
  [v33 setValue:v42 forKey:@"post_excerpt"];

  [v33 setValue:v43 forKey:@"post_template"];
  [v33 setValue:v28 forKey:@"terms_names"];
  [v33 setValue:v44 forKey:@"post_thumbnail"];

  [v33 setValue:v32 forKey:@"custom_fields"];
  if (a9) {
    v35 = @"open";
  }
  else {
    v35 = @"closed";
  }
  [v33 setValue:v35 forKey:@"comment_status"];
  [(WFWordPressSessionManager *)self createPostWithContent:v33 completionHandler:v45];
}

void __179__WFWordPressSessionManager_createPostWithTitle_content_type_date_format_status_allowingComments_name_excerpt_template_tags_categories_thumbnailId_customFields_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v10[2] = *MEMORY[0x263EF8340];
  v4 = *(void **)(a1 + 32);
  v9[0] = @"key";
  v9[1] = @"value";
  v10[0] = a2;
  v10[1] = a3;
  id v5 = NSDictionary;
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 addObject:v8];
}

id __179__WFWordPressSessionManager_createPostWithTitle_content_type_date_format_status_allowingComments_name_excerpt_template_tags_categories_thumbnailId_customFields_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 length])
  {
    v3 = [v2 stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __179__WFWordPressSessionManager_createPostWithTitle_content_type_date_format_status_allowingComments_name_excerpt_template_tags_categories_thumbnailId_customFields_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 length])
  {
    v3 = [v2 stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)getPageTemplatesWithCompletionHandler:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFWordPressSessionManager *)self blogId];
  id v6 = (void *)v5;
  id v7 = &unk_26F074B68;
  if (v5) {
    id v7 = (void *)v5;
  }
  uint64_t v8 = [(WFWordPressSessionManager *)self username];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_26F008428;
  }
  v15[1] = v10;
  uint64_t v11 = [(WFWordPressSessionManager *)self password];
  char v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_26F008428;
  }
  v15[2] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  [(WFWordPressSessionManager *)self sendRequestWithMethod:@"wp.getPageTemplates" parameters:v14 completionHandler:v4];
}

- (void)getPostStatusesWithCompletionHandler:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFWordPressSessionManager *)self blogId];
  id v6 = (void *)v5;
  id v7 = &unk_26F074B68;
  if (v5) {
    id v7 = (void *)v5;
  }
  uint64_t v8 = [(WFWordPressSessionManager *)self username];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_26F008428;
  }
  v15[1] = v10;
  uint64_t v11 = [(WFWordPressSessionManager *)self password];
  char v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_26F008428;
  }
  v15[2] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  [(WFWordPressSessionManager *)self sendRequestWithMethod:@"wp.getPostStatusList" parameters:v14 completionHandler:v4];
}

- (void)getPostFormatsWithCompletionHandler:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFWordPressSessionManager *)self blogId];
  id v6 = (void *)v5;
  id v7 = &unk_26F074B68;
  if (v5) {
    id v7 = (void *)v5;
  }
  uint64_t v8 = [(WFWordPressSessionManager *)self username];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_26F008428;
  }
  v15[1] = v10;
  uint64_t v11 = [(WFWordPressSessionManager *)self password];
  char v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_26F008428;
  }
  v15[2] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  [(WFWordPressSessionManager *)self sendRequestWithMethod:@"wp.getPostFormats" parameters:v14 completionHandler:v4];
}

- (void)getPostTypesWithCompletionHandler:(id)a3
{
  v18[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFWordPressSessionManager *)self blogId];
  id v6 = (void *)v5;
  id v7 = &unk_26F074B68;
  if (v5) {
    id v7 = (void *)v5;
  }
  v18[0] = v7;
  uint64_t v8 = [(WFWordPressSessionManager *)self username];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_26F008428;
  }
  v18[1] = v10;
  uint64_t v11 = [(WFWordPressSessionManager *)self password];
  char v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_26F008428;
  }
  v18[2] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__WFWordPressSessionManager_getPostTypesWithCompletionHandler___block_invoke;
  v16[3] = &unk_264E5A4C0;
  id v17 = v4;
  id v15 = v4;
  [(WFWordPressSessionManager *)self sendRequestWithMethod:@"wp.getPostTypes" parameters:v14 completionHandler:v16];
}

void __63__WFWordPressSessionManager_getPostTypesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = a1;
    id v7 = v5;
    uint64_t v8 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        uint64_t v14 = v6;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * v13);
          uint64_t v16 = (void *)MEMORY[0x263F86840];
          uint64_t v17 = objc_opt_class();
          v18 = [v9 objectForKeyedSubscript:v15];
          id v23 = v14;
          id v19 = [v16 modelOfClass:v17 fromJSONDictionary:v18 error:&v23];
          id v6 = v23;

          [v8 setValue:v19 forKey:v15];
          ++v13;
          uint64_t v14 = v6;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    v20 = (void *)[v8 copy];
    a1 = v22;
  }
  else
  {

    v20 = 0;
  }
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    (*(void (**)(uint64_t, void *, id))(v21 + 16))(v21, v20, v6);
  }
}

- (void)getTermsForTaxonomy:(id)a3 completionHandler:(id)a4
{
  v21[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(WFWordPressSessionManager *)self blogId];
  id v9 = (void *)v8;
  uint64_t v10 = &unk_26F074B68;
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  v21[0] = v10;
  uint64_t v11 = [(WFWordPressSessionManager *)self username];
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_26F008428;
  }
  v21[1] = v13;
  uint64_t v14 = [(WFWordPressSessionManager *)self password];
  uint64_t v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  else {
    uint64_t v16 = &stru_26F008428;
  }
  v21[2] = v16;
  v21[3] = v7;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__WFWordPressSessionManager_getTermsForTaxonomy_completionHandler___block_invoke;
  v19[3] = &unk_264E5A4C0;
  id v20 = v6;
  id v18 = v6;
  [(WFWordPressSessionManager *)self sendRequestWithMethod:@"wp.getTerms" parameters:v17 completionHandler:v19];
}

void __67__WFWordPressSessionManager_getTermsForTaxonomy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = [MEMORY[0x263F86840] modelsOfClass:objc_opt_class() fromJSONArray:v5 error:&v9];
    id v7 = v9;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getBlogsWithCompletionHandler:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFWordPressSessionManager *)self username];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_26F008428;
  }
  v15[0] = v7;
  uint64_t v8 = [(WFWordPressSessionManager *)self password];
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = &stru_26F008428;
  }
  v15[1] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__WFWordPressSessionManager_getBlogsWithCompletionHandler___block_invoke;
  v13[3] = &unk_264E5A4C0;
  id v14 = v4;
  id v12 = v4;
  [(WFWordPressSessionManager *)self sendRequestWithMethod:@"wp.getUsersBlogs" parameters:v11 completionHandler:v13];
}

void __59__WFWordPressSessionManager_getBlogsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = [MEMORY[0x263F86840] modelsOfClass:objc_opt_class() fromJSONArray:v5 error:&v9];
    id v7 = v9;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (WFWordPressSessionManager)initWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWordPressSessionManager;
  id v5 = [(WFWordPressSessionManager *)&v12 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFC640];
    id v7 = v4;
    if (!v4)
    {
      id v7 = objc_msgSend(MEMORY[0x263EFC648], "wf_defaultSessionConfiguration");
    }
    uint64_t v8 = [v6 sessionWithConfiguration:v7];
    session = v5->_session;
    v5->_session = (NSURLSession *)v8;

    if (!v4) {
    uint64_t v10 = v5;
    }
  }

  return v5;
}

- (WFWordPressSessionManager)init
{
  return [(WFWordPressSessionManager *)self initWithSessionConfiguration:0];
}

@end