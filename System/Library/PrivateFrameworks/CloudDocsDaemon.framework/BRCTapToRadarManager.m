@interface BRCTapToRadarManager
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12;
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12 completionHandler:(id)a13;
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9;
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9 completionHandler:(id)a10;
@end

@implementation BRCTapToRadarManager

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9
{
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9 completionHandler:(id)a10
{
  LOBYTE(v10) = a7;
  [(BRCTapToRadarManager *)self requestTapToRadarWithTitle:a3 description:a4 componentName:@"CloudDocs" componentVersion:@"All" componentID:554159 keywords:a5 attachments:a6 sendFullLog:v10 displayReason:a8 triggerRootCause:a9 completionHandler:a10];
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12
{
  LOBYTE(v12) = a10;
  [(BRCTapToRadarManager *)self requestTapToRadarWithTitle:a3 description:a4 componentName:a5 componentVersion:a6 componentID:a7 keywords:a8 attachments:a9 sendFullLog:v12 displayReason:a11 triggerRootCause:a12 completionHandler:0];
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12 completionHandler:(id)a13
{
  if (a13) {
    id v13 = a13;
  }
  else {
    id v13 = &__block_literal_global_21;
  }
  v14 = (void (**)(void, void))MEMORY[0x1D94389C0](v13, a2, a3, a4, a5, a6, a7, a8);
  if (([MEMORY[0x1E4F59530] isInternalBuild] & 1) == 0)
  {
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:]((uint64_t)v15, v16);
    }
  }
  v17 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorNotSupportedInCustomerBuild");
  ((void (**)(void, void *))v14)[2](v14, v17);
}

- (void).cxx_destruct
{
}

- (void)requestTapToRadarWithTitle:(uint64_t)a1 description:(NSObject *)a2 componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not internal build, ignoring tap to radar request%@", (uint8_t *)&v2, 0xCu);
}

@end