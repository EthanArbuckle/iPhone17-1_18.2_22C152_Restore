@interface CalDAVMkcalendarTask
- (CalDAVMkcalendarTask)initWithPropertiesToSet:(id)a3 atURL:(id)a4;
- (CalDAVMkcalendarTask)initWithURL:(id)a3;
- (NSSet)setElements;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)description;
- (id)httpMethod;
- (id)requestBody;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setSetElements:(id)a3;
- (void)setSupportForEvents:(BOOL)a3 tasks:(BOOL)a4;
@end

@implementation CalDAVMkcalendarTask

- (CalDAVMkcalendarTask)initWithURL:(id)a3
{
  return [(CalDAVMkcalendarTask *)self initWithPropertiesToSet:0 atURL:a3];
}

- (CalDAVMkcalendarTask)initWithPropertiesToSet:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CalDAVMkcalendarTask;
  v7 = [(CalDAVMkcalendarTask *)&v10 initWithURL:a4];
  v8 = v7;
  if (v7) {
    [(CalDAVMkcalendarTask *)v7 setSetElements:v6];
  }

  return v8;
}

- (void)setSupportForEvents:(BOOL)a3 tasks:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3 == a4)
  {
    BOOL v13 = a4;
    v14 = [MEMORY[0x263F34B30] sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F34C50]));
    v16 = [v14 logHandleForAccountInfoProvider:WeakRetained];

    if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v19 = v4;
      __int16 v20 = 1024;
      BOOL v21 = v13;
      _os_log_impl(&dword_213CEC000, v16, OS_LOG_TYPE_INFO, "setSupportForEvents:tasks: called with identical values for supportVEVENT (%d) and supportVTODO (%d), doing nothing", buf, 0xEu);
    }
  }
  else
  {
    id v6 = [(CalDAVMkcalendarTask *)self setElements];
    id v17 = [v6 objectsPassingTest:&__block_literal_global];

    v7 = objc_alloc_init(CalDAVSupportedCalendarComponentSet);
    v8 = objc_alloc_init(CalDAVCompItem);
    v9 = v8;
    objc_super v10 = cdEventComponentType;
    if (!v4) {
      objc_super v10 = cdTodoComponentType;
    }
    [(CalDAVCompItem *)v8 setNameAttribute:*v10];
    v11 = [MEMORY[0x263EFF9C0] setWithObject:v9];
    [(CalDAVSupportedCalendarComponentSet *)v7 setComps:v11];

    v12 = [v17 setByAddingObject:v7];
    [(CalDAVMkcalendarTask *)self setSetElements:v12];
  }
}

uint64_t __50__CalDAVMkcalendarTask_setSupportForEvents_tasks___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 name];
  if ([v3 isEqualToString:*MEMORY[0x263F34F40]])
  {
    BOOL v4 = [v2 nameSpace];
    int v5 = [v4 isEqualToString:*MEMORY[0x263F34CD8]];

    uint64_t v6 = v5 ^ 1u;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (id)description
{
  v3 = [(CalDAVMkcalendarTask *)self setElements];
  if (v3)
  {
    BOOL v4 = [(CalDAVMkcalendarTask *)self setElements];
    uint64_t v5 = [v4 count];
  }
  else
  {
    uint64_t v5 = 0;
  }

  uint64_t v6 = [(CalDAVMkcalendarTask *)self requestBody];
  id v7 = [NSString alloc];
  id v8 = v6;
  v9 = objc_msgSend(v7, "initWithBytes:length:encoding:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 4);
  objc_super v10 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)CalDAVMkcalendarTask;
  v11 = [(CalDAVMkcalendarTask *)&v14 description];
  v12 = [v10 stringWithFormat:@"[%@] Number of properties to set: [%u], Request body: [%@]", v11, v5, v9];

  return v12;
}

- (id)httpMethod
{
  return @"MKCALENDAR";
}

- (id)requestBody
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CalDAVMkcalendarTask *)self setElements];
  if (v3
    && (BOOL v4 = (void *)v3,
        [(CalDAVMkcalendarTask *)self setElements],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    id v7 = objc_alloc_init(MEMORY[0x263F34BB8]);
    [v7 startElement:@"mkcalendar" inNamespace:*MEMORY[0x263F34CD8] withAttributeNamesAndValues:0];
    uint64_t v8 = [(CalDAVMkcalendarTask *)self setElements];
    if (v8)
    {
      v9 = (void *)v8;
      objc_super v10 = [(CalDAVMkcalendarTask *)self setElements];
      uint64_t v11 = [v10 count];

      uint64_t v12 = *MEMORY[0x263F34E10];
      if (v11)
      {
        uint64_t v13 = *MEMORY[0x263F34F30];
        [v7 startElement:*MEMORY[0x263F34F30] inNamespace:*MEMORY[0x263F34E10] withAttributeNamesAndValues:0];
        uint64_t v14 = *MEMORY[0x263F34EE0];
        [v7 startElement:*MEMORY[0x263F34EE0] inNamespace:v12 withAttributeNamesAndValues:0];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v15 = [(CalDAVMkcalendarTask *)self setElements];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v23 != v18) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*((void *)&v22 + 1) + 8 * i) write:v7];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v17);
        }

        [v7 endElement:v14 inNamespace:v12];
        [v7 endElement:v13 inNamespace:v12];
      }
    }
    else
    {
      uint64_t v12 = *MEMORY[0x263F34E10];
    }
    [v7 endElement:@"mkcalendar" inNamespace:v12];
    __int16 v20 = [v7 data];
  }
  else
  {
    __int16 v20 = 0;
  }
  return v20;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F34BC0]);
  uint64_t v5 = *MEMORY[0x263F34CD8];
  uint64_t v6 = objc_opt_class();
  id v7 = [(CalDAVMkcalendarTask *)self url];
  uint64_t v8 = (void *)[v4 initWithRootElementNameSpace:v5 name:@"mkcalendar-response" parseClass:v6 baseURL:v7];

  return v8;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    id v7 = [MEMORY[0x263F34B30] sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F34C50]));
    v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

    if (v6 == 1)
    {
      if (v9)
      {
        objc_super v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v22 = (id)objc_opt_class();
          id v11 = v22;
          uint64_t v12 = "%{public}@ cancelled";
          uint64_t v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 12;
LABEL_9:
          _os_log_impl(&dword_213CEC000, v13, v14, v12, buf, v15);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (v9)
    {
      uint64_t v16 = v9;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v22 = (id)objc_opt_class();
        __int16 v23 = 2112;
        long long v24 = v5;
        id v11 = v22;
        uint64_t v12 = "%{public}@ failed: %@";
        uint64_t v13 = v16;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 22;
        goto LABEL_9;
      }
LABEL_10:
    }
  }
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F34C58]) = 0;
  uint64_t v17 = [(CalDAVMkcalendarTask *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    BOOL v19 = [(CalDAVMkcalendarTask *)self delegate];
    [v19 mkcalendarTask:self error:v5];
  }
  v20.receiver = self;
  v20.super_class = (Class)CalDAVMkcalendarTask;
  [(CalDAVMkcalendarTask *)&v20 finishCoreDAVTaskWithError:v5];
}

- (NSSet)setElements
{
  return self->_setElements;
}

- (void)setSetElements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end