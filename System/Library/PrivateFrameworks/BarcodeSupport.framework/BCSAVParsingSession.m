@interface BCSAVParsingSession
- (BCSAVParsingSession)init;
- (BOOL)_isLikelyLastScannedObject:(id)a3;
- (BOOL)_shouldSkipIncomingObject:(id)a3;
- (double)_temporalStickyFactorForObject:(id)a3;
- (id)_bestObjectForParsing:(id)a3;
- (void)_updateSessionWithMetadataObject:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)updateSessionWithMetadataObjects:(id)a3;
- (void)updateSessionWithMetadataObjects:(id)a3 completionHandler:(id)a4;
@end

@implementation BCSAVParsingSession

- (BCSAVParsingSession)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)BCSAVParsingSession;
  v2 = [(BCSAVParsingSession *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(BCSQRCodeParser);
    parser = v2->_parser;
    v2->_parser = v3;

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v9 = v2;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSAVParsingSession (%p): Created", buf, 0xCu);
    }
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [(BCSQRCodeParser *)self->_parser stopQRCodeParsingSession];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v5 = self;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSAVParsingSession (%p): Deallocated", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)BCSAVParsingSession;
  [(BCSAVParsingSession *)&v3 dealloc];
}

- (BOOL)_isLikelyLastScannedObject:(id)a3
{
  lastScannedCodeBasicDescriptor = self->_lastScannedCodeBasicDescriptor;
  if (lastScannedCodeBasicDescriptor) {
    return objc_msgSend(a3, "_bcs_probablyContainsSameCodeInBasicDescriptor:", lastScannedCodeBasicDescriptor);
  }
  else {
    return 0;
  }
}

- (void)_updateSessionWithMetadataObject:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(BCSAVParsingSession *)self _isLikelyLastScannedObject:v6])
  {
    v8 = [v6 basicDescriptor];
    lastScannedCodeBasicDescriptor = self->_lastScannedCodeBasicDescriptor;
    self->_lastScannedCodeBasicDescriptor = v8;

    self->_lastScannedTime = CFAbsoluteTimeGetCurrent();
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __74__BCSAVParsingSession__updateSessionWithMetadataObject_completionHandler___block_invoke;
    v15 = &unk_26468B020;
    id v17 = v7;
    id v10 = v6;
    id v16 = v10;
    v11 = (void *)MEMORY[0x223CAD0D0](&v12);
    -[BCSQRCodeParser startQRCodeParsingSessionWithMetadataObject:completionHandler:](self->_parser, "startQRCodeParsingSessionWithMetadataObject:completionHandler:", v10, v11, v12, v13, v14, v15);

    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    -[BCSAVParsingSession _updateSessionWithMetadataObject:completionHandler:]((uint64_t)self);
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  if (v7) {
LABEL_4:
  }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
LABEL_6:
}

void __74__BCSAVParsingSession__updateSessionWithMetadataObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
  }
  v7();
LABEL_7:
}

- (void)updateSessionWithMetadataObjects:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(BCSAVParsingSession *)self _bestObjectForParsing:v9];
  if (v7)
  {
    if ([v9 count] == 1
      && [(BCSAVParsingSession *)self _shouldSkipIncomingObject:v7])
    {
      if (v6) {
        (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
      }
    }
    else
    {
      [(BCSAVParsingSession *)self _updateSessionWithMetadataObject:v7 completionHandler:v6];
    }
  }
  else if (v6)
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSErrorDomain" code:5 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v8);
  }
}

- (double)_temporalStickyFactorForObject:(id)a3
{
  if (![(BCSAVParsingSession *)self _isLikelyLastScannedObject:a3]) {
    return 1.0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = Current - self->_lastScannedTime;
  self->_lastScannedTime = Current;
  return fmin(v5 * v5, 1.0);
}

- (BOOL)_shouldSkipIncomingObject:(id)a3
{
  v4 = [a3 type];
  double v5 = (void *)*MEMORY[0x263EF9F40];

  if (v4 != v5) {
    return 0;
  }
  lastScannedCodeBasicDescriptor = self->_lastScannedCodeBasicDescriptor;
  if (!lastScannedCodeBasicDescriptor) {
    return 0;
  }
  id v9 = [(NSDictionary *)lastScannedCodeBasicDescriptor objectForKeyedSubscript:@"BarcodeType"];
  int v10 = [v9 isEqualToString:@"com.apple.AppClipCode"];

  if (!v10 || CFAbsoluteTimeGetCurrent() - self->_lastScannedTime > 0.75) {
    return 0;
  }
  BOOL v6 = 1;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSAVParsingSession: Skipping a QR code since an app clip code was selected a short while ago (< 750ms).", v11, 2u);
  }
  return v6;
}

- (id)_bestObjectForParsing:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    double v5 = [v4 firstObject];
  }
  else if ((unint64_t)[v4 count] <= 2)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__BCSAVParsingSession__bestObjectForParsing___block_invoke;
    v7[3] = &unk_26468B048;
    v7[4] = self;
    v7[5] = v12;
    v7[6] = &v8;
    [v4 enumerateObjectsUsingBlock:v7];
    double v5 = [v4 objectAtIndex:v9[3]];
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(v12, 8);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

void __45__BCSAVParsingSession__bestObjectForParsing___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 bounds];
  _bcs_pointToRectDistance(0.5, 0.5, v6, v7, v8, v9);
  double v11 = v10;
  [*(id *)(a1 + 32) _temporalStickyFactorForObject:v5];
  double v13 = v12;

  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v11 * v13 < *(double *)(v14 + 24))
  {
    *(double *)(v14 + 24) = v11 * v13;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
}

- (void)updateSessionWithMetadataObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScannedCodeBasicDescriptor, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

- (void)_updateSessionWithMetadataObject:(uint64_t)a1 completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSAVParsingSession (%p): Skip processing of same QR code", (uint8_t *)&v1, 0xCu);
}

@end