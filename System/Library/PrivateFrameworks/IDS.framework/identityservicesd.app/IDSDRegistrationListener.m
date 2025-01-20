@interface IDSDRegistrationListener
+ (id)sharedInstance;
- (IDSDRegistrationListener)init;
- (NSMutableSet)completionBlocks;
- (id)addBlockForRegistrationCompletion:(id)a3;
- (void)_callBlocksWithResult:(BOOL)a3 registrations:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)registrationController:(id)a3 allRegistrationsSucceeded:(id)a4;
- (void)removeBlockForIdentifier:(id)a3;
- (void)setCompletionBlocks:(id)a3;
@end

@implementation IDSDRegistrationListener

+ (id)sharedInstance
{
  if (qword_100A4AA38 != -1) {
    dispatch_once(&qword_100A4AA38, &stru_100985940);
  }
  v2 = (void *)qword_100A4AA40;

  return v2;
}

- (IDSDRegistrationListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSDRegistrationListener;
  v2 = [(IDSDRegistrationListener *)&v7 init];
  if (v2)
  {
    v3 = +[IDSRegistrationController sharedInstance];
    [v3 addListener:v2];

    v4 = +[IMRGLog registrationListener];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting Up", v6, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[IDSRegistrationController sharedInstance];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IDSDRegistrationListener;
  [(IDSDRegistrationListener *)&v4 dealloc];
}

- (id)addBlockForRegistrationCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_completionBlocks)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionBlocks = self->_completionBlocks;
    self->_completionBlocks = v5;
  }
  id v7 = [v4 copy];

  v8 = self->_completionBlocks;
  id v9 = objc_retainBlock(v7);
  [(NSMutableSet *)v8 addObject:v9];

  id v10 = objc_retainBlock(v7);

  return v10;
}

- (void)removeBlockForIdentifier:(id)a3
{
}

- (void)_callBlocksWithResult:(BOOL)a3 registrations:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_completionBlocks;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)registrationController:(id)a3 allRegistrationsSucceeded:(id)a4
{
  id v5 = a4;
  v6 = +[IMRGLog registrationListener];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Told all registrations succeeded, calling completion blocks", v7, 2u);
  }

  [(IDSDRegistrationListener *)self _callBlocksWithResult:1 registrations:v5 error:0];
}

- (NSMutableSet)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end