@interface PKTextInputRecognitionManager
- (NSArray)textInputTargets;
- (id)strokeProviderSnapshot;
- (id)textInputTargetForItemStableIdentifier:(id)a3 strokeIdentifiers:(id)a4;
- (id)textInputTargetForItemStableIdentifier:(id)a3 strokeIdentifiers:(id)a4 simultaneousItemStableIdentifiers:(id)a5;
- (uint64_t)_updateRecognitionSession;
- (uint64_t)setPreferOutOfProcessRecognition:(uint64_t)result;
- (void)_processQueryDidUpdateResult:(uint64_t)a1;
- (void)beginRecognitionRequestWithDataSource:(void *)a1;
- (void)dealloc;
- (void)fetchContentInfoForTextInputTarget:(id)a3 strokeIdentifiers:(id)a4 completion:(id)a5;
- (void)queryDidUpdateResult:(id)a3;
- (void)reportDebugStateDescription:(id)a3;
- (void)setRecognitionLocales:(uint64_t)a1;
@end

@implementation PKTextInputRecognitionManager

- (void)dealloc
{
  if (self)
  {
    [(CHRecognitionSession *)self->__recognitionSession setDataSource:0];
    [(CHTextInputQuery *)self->__textInputQuery setDelegate:0];
    textInputQuery = self->__textInputQuery;
  }
  else
  {
    [0 setDataSource:0];
    [0 setDelegate:0];
    textInputQuery = 0;
  }
  [(CHTextInputQuery *)textInputQuery setTextInputTargetsDataSource:0];
  v4.receiver = self;
  v4.super_class = (Class)PKTextInputRecognitionManager;
  [(PKTextInputRecognitionManager *)&v4 dealloc];
}

- (void)beginRecognitionRequestWithDataSource:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_super v4 = (void *)a1[4];
    id v9 = v3;
    id v5 = v3;
    v6 = (void *)a1[3];
    a1[3] = v5;
    id v7 = v4;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    a1[6] = v8;
    [v7 setNeedsRecognitionUpdate];

    id v3 = v9;
  }
}

- (void)setRecognitionLocales:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_super v4 = *(void **)(a1 + 16);
    id v10 = v3;
    unint64_t v5 = (unint64_t)v3;
    unint64_t v6 = v4;
    id v3 = v10;
    if (v5 | v6)
    {
      if (v5 && v6)
      {
        char v7 = [(id)v5 isEqual:v6];

        id v3 = v10;
        if (v7) {
          goto LABEL_9;
        }
      }
      else
      {
      }
      uint64_t v8 = [(id)v5 copy];
      id v9 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v8;

      -[PKTextInputRecognitionManager _updateRecognitionSession](a1);
      +[PKTextInputDebugStateIntrospector debugStateDidChange];
      id v3 = v10;
    }
  }
LABEL_9:
}

- (uint64_t)_updateRecognitionSession
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 16) count];
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F5C068]) initWithMode:1];
    uint64_t v8 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v7;

    [*(id *)(a1 + 32) setDataSource:a1];
    [*(id *)(a1 + 32) setPriority:1];
  }
  else
  {
    if (v2) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v3 == 0;
    }
    if (!v5)
    {
      [v3 setDataSource:0];
      unint64_t v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
  }
  if (*(void *)(a1 + 32))
  {
    id v9 = (void *)MEMORY[0x1E4F1CA48];
    id v10 = *(id *)(a1 + 16);
    v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

    v12 = *(void **)(a1 + 16);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__PKTextInputRecognitionManager__updateRecognitionSession__block_invoke;
    v25[3] = &unk_1E64CA7E8;
    id v13 = v11;
    id v26 = v13;
    [v12 enumerateObjectsUsingBlock:v25];
    v14 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v13 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 134218242;
      uint64_t v28 = a1;
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEFAULT, "Recognition Manager %p: Set recognition locales: %@", buf, 0x16u);
    }
    v16 = *(void **)(a1 + 32);
    id v17 = *(id *)(a1 + 16);
    [v16 setPreferredLocales:v17];

    if (*(unsigned char *)(a1 + 8)) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }
    [*(id *)(a1 + 32) setRecognitionEnvironment:v18];
  }
  id v19 = *(id *)(a1 + 40);
  if (v19)
  {
  }
  else if (*(void *)(a1 + 32))
  {
    id v20 = objc_alloc(MEMORY[0x1E4F5C0A0]);
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = [v20 initWithRecognitionSession:v21];
    v23 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v22;

    [*(id *)(a1 + 40) setDelegate:a1];
    [*(id *)(a1 + 40) setTextInputTargetsDataSource:a1];
    [*(id *)(a1 + 40) setPreferredUpdatesInterval:0.0];
    [*(id *)(a1 + 40) start];
  }
  +[PKTextInputDebugStateIntrospector debugStateDidChange];
  return +[PKTextInputDebugStateIntrospector debugStateDidChange];
}

- (uint64_t)setPreferOutOfProcessRecognition:(uint64_t)result
{
  if (result && *(unsigned __int8 *)(result + 8) != a2)
  {
    *(unsigned char *)(result + 8) = a2;
    -[PKTextInputRecognitionManager _updateRecognitionSession](result);
    return +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
  return result;
}

void __58__PKTextInputRecognitionManager__updateRecognitionSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 localeIdentifier];
  BOOL v4 = (void *)v3;
  BOOL v5 = &stru_1F1FB2C00;
  if (v3) {
    BOOL v5 = (__CFString *)v3;
  }
  unint64_t v6 = v5;

  [*(id *)(a1 + 32) addObject:v6];
}

- (void)queryDidUpdateResult:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (CHTextInputQuery *)a3;
  BOOL v5 = v4;
  if (self) {
    textInputQuery = self->__textInputQuery;
  }
  else {
    textInputQuery = 0;
  }
  if (textInputQuery == v4)
  {
    uint64_t v7 = +[PKTextInputSettings sharedSettings];
    [v7 debugRecognitionRequestArtificialDelay];
    double v9 = v8;

    if (v9 <= 0.01)
    {
      -[PKTextInputRecognitionManager _processQueryDidUpdateResult:]((uint64_t)self, v5);
    }
    else
    {
      id v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v15 = self;
        __int16 v16 = 2048;
        double v17 = v9;
        _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Recognition Manager %p: debug artificial delay for queryDidUpdateResult: %0.2f", buf, 0x16u);
      }

      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__PKTextInputRecognitionManager_queryDidUpdateResult___block_invoke;
      v12[3] = &unk_1E64C5F60;
      v12[4] = self;
      id v13 = v5;
      dispatch_after(v11, MEMORY[0x1E4F14428], v12);
    }
  }
}

void __54__PKTextInputRecognitionManager_queryDidUpdateResult___block_invoke(uint64_t a1)
{
}

- (void)_processQueryDidUpdateResult:(uint64_t)a1
{
  id v14 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 24);
    BOOL v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    if (v3)
    {
      BOOL v5 = [v14 lastProcessedStrokeProviderVersion];
      uint64_t v6 = [v5 integerValue];

      uint64_t v7 = [v3 recognitionManagerStrokeProvider:a1];
      double v8 = [v7 strokeProviderVersion];
      uint64_t v9 = [v8 integerValue];

      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v11 = v10 - *(double *)(a1 + 48);
      *(double *)(a1 + 56) = v11;
      if (v6 >= v9)
      {
        id v13 = [v14 availableItems];
        [v3 recognitionManager:a1 recognitionDidFinishWithQueryItems:v13 duration:v11];
      }
      else
      {
        v12 = [v14 lastProcessedStrokeProviderVersion];

        if (!v12) {
          [v3 recognitionManager:a1 recognitionDidFinishWithQueryItems:MEMORY[0x1E4F1CBF0] duration:v11];
        }
      }
    }
  }
}

- (id)strokeProviderSnapshot
{
  if (self && (id v3 = self->_currentDataSource) != 0)
  {
    BOOL v4 = (PKDrawing *)v3;
    BOOL v5 = [(PKTextInputRecognitionManagerDataSource *)v3 recognitionManagerStrokeProvider:self];
  }
  else
  {
    BOOL v4 = objc_alloc_init(PKDrawing);
    BOOL v5 = [[PKTextInputStrokeProvider alloc] initWithDrawing:v4];
  }
  uint64_t v6 = v5;

  return v6;
}

- (NSArray)textInputTargets
{
  uint64_t v2 = self;
  if (self) {
    self = (PKTextInputRecognitionManager *)self->_currentDataSource;
  }
  id v3 = [(PKTextInputRecognitionManager *)self recognitionManagerTextInputTargets:v2];
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (id)textInputTargetForItemStableIdentifier:(id)a3 strokeIdentifiers:(id)a4
{
  return [(PKTextInputRecognitionManager *)self textInputTargetForItemStableIdentifier:a3 strokeIdentifiers:a4 simultaneousItemStableIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (id)textInputTargetForItemStableIdentifier:(id)a3 strokeIdentifiers:(id)a4 simultaneousItemStableIdentifiers:(id)a5
{
  double v8 = self;
  if (self) {
    self = (PKTextInputRecognitionManager *)self->_currentDataSource;
  }
  return (id)[(PKTextInputRecognitionManager *)self recognitionManager:v8 textInputTargetForItemStableIdentifier:a3 strokeIdentifiers:a4 simultaneousItemStableIdentifiers:a5];
}

- (void)fetchContentInfoForTextInputTarget:(id)a3 strokeIdentifiers:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void))a5;
  if (self && (currentDataSource = self->_currentDataSource) != 0) {
    [(PKTextInputRecognitionManagerDataSource *)currentDataSource recognitionManager:self fetchContentInfoForTextInputTarget:v11 strokeIdentifiers:v8 completion:v9];
  }
  else {
    v9[2](v9, 0);
  }
}

- (void)reportDebugStateDescription:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, __CFString *, void *))a3;
  if (self) {
    recognitionLocales = self->_recognitionLocales;
  }
  else {
    recognitionLocales = 0;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](recognitionLocales, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (self) {
    uint64_t v7 = self->_recognitionLocales;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v21 + 1) + 8 * i) localeIdentifier];
        if (v13) {
          [v6 addObject:v13];
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v14 = [v6 componentsJoinedByString:@", "];
  v4[2](v4, @"Locales", v14);
  if (self)
  {
    v15 = [(CHRecognitionSession *)self->__recognitionSession description];
    v4[2](v4, @"Recognition session", v15);

    textInputQuery = self->__textInputQuery;
  }
  else
  {
    id v20 = [0 description];
    v4[2](v4, @"Recognition session", v20);

    textInputQuery = 0;
  }
  double v17 = [(CHTextInputQuery *)textInputQuery description];
  v4[2](v4, @"Text input query", v17);

  if (self) {
    double lastRecognitionDuration = self->__lastRecognitionDuration;
  }
  else {
    double lastRecognitionDuration = 0.0;
  }
  id v19 = objc_msgSend(NSString, "stringWithFormat:", @"%0.3f s", *(void *)&lastRecognitionDuration);
  v4[2](v4, @"Last request duration", v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textInputQuery, 0);
  objc_storeStrong((id *)&self->__recognitionSession, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);

  objc_storeStrong((id *)&self->_recognitionLocales, 0);
}

@end