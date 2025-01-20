@interface ISIcon(CUIKIcon)
- (CUIKIcon)initWithDate:()CUIKIcon calendar:format:;
- (CUIKIcon)initWithDateComponents:()CUIKIcon calendar:format:forceNoTextEffects:;
@end

@implementation ISIcon(CUIKIcon)

- (CUIKIcon)initWithDate:()CUIKIcon calendar:format:
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = [[CUIKIcon alloc] initWithDate:v8 calendar:v9 format:a5];
  }
  else
  {
    v12 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ISIcon(CUIKIcon) initWithDate:calendar:format:](v12);
    }

    v11 = 0;
  }

  return v11;
}

- (CUIKIcon)initWithDateComponents:()CUIKIcon calendar:format:forceNoTextEffects:
{
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (v10 && v11)
  {
    v13 = [[CUIKIcon alloc] initWithDateComponents:v10 calendar:v11 format:a5 forceNoTextEffects:a6];
  }
  else
  {
    v14 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ISIcon(CUIKIcon) initWithDateComponents:calendar:format:forceNoTextEffects:](v14);
    }

    v13 = 0;
  }

  return v13;
}

- (void)initWithDate:()CUIKIcon calendar:format:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "date or calendar are nil, returning nil", v1, 2u);
}

- (void)initWithDateComponents:()CUIKIcon calendar:format:forceNoTextEffects:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "dateComponents or calendar are nil, returning nil", v1, 2u);
}

@end