@interface BLSAlwaysOnTimelineUnconfiguredEntry
+ (id)entryForPresentationTime:(id)a3;
+ (id)entryForPresentationTime:(id)a3 animated:(BOOL)a4 userObject:(id)a5;
+ (id)entryForPresentationTime:(id)a3 withRequestedFidelity:(int64_t)a4;
+ (id)entryForPresentationTime:(id)a3 withRequestedFidelity:(int64_t)a4 animated:(BOOL)a5 userObject:(id)a6;
- (BLSAlwaysOnTimelineUnconfiguredEntry)initWithPresentationTime:(id)a3 requestedFidelity:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 timelineIdentifier:(id)a7 userObject:(id)a8;
@end

@implementation BLSAlwaysOnTimelineUnconfiguredEntry

- (BLSAlwaysOnTimelineUnconfiguredEntry)initWithPresentationTime:(id)a3 requestedFidelity:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 timelineIdentifier:(id)a7 userObject:(id)a8
{
  BOOL v11 = a5;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BLSAlwaysOnTimelineUnconfiguredEntry;
  v18 = [(BLSAlwaysOnTimelineEntry *)&v21 initWithPresentationTime:v15 requestedFidelity:a4 animated:v11 duration:v16 timelineIdentifier:v17 userObject:a6];
  if (v18)
  {
    if (objc_opt_respondsToSelector())
    {
      if (objc_opt_respondsToSelector()) {
        goto LABEL_4;
      }
      v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[self respondsToSelector:@selector(setRequestedFidelity:)]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BLSAlwaysOnTimelineUnconfiguredEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:](a2, (uint64_t)v18, (uint64_t)v20);
      }
    }
    else
    {
      v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[self respondsToSelector:@selector(setTimelineIdentifier:)]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BLSAlwaysOnTimelineUnconfiguredEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:](a2, (uint64_t)v18, (uint64_t)v20);
      }
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B55E4D98);
  }
LABEL_4:

  return v18;
}

+ (id)entryForPresentationTime:(id)a3 withRequestedFidelity:(int64_t)a4
{
  id v5 = a3;
  v6 = [[BLSAlwaysOnTimelineUnconfiguredEntry alloc] initWithPresentationTime:v5 requestedFidelity:a4 animated:0 duration:0 timelineIdentifier:0 userObject:0.2];

  return v6;
}

+ (id)entryForPresentationTime:(id)a3
{
  return (id)[a1 entryForPresentationTime:a3 withRequestedFidelity:-1];
}

+ (id)entryForPresentationTime:(id)a3 withRequestedFidelity:(int64_t)a4 animated:(BOOL)a5 userObject:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  BOOL v11 = [[BLSAlwaysOnTimelineUnconfiguredEntry alloc] initWithPresentationTime:v10 requestedFidelity:a4 animated:v6 duration:0 timelineIdentifier:v9 userObject:0.2];

  return v11;
}

+ (id)entryForPresentationTime:(id)a3 animated:(BOOL)a4 userObject:(id)a5
{
  return (id)[a1 entryForPresentationTime:a3 withRequestedFidelity:-1 animated:a4 userObject:a5];
}

- (void)initWithPresentationTime:(uint64_t)a3 requestedFidelity:animated:duration:timelineIdentifier:userObject:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"BLSAlwaysOnTimelineEntry.m";
  __int16 v10 = 1024;
  int v11 = 146;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1B55DE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithPresentationTime:(uint64_t)a3 requestedFidelity:animated:duration:timelineIdentifier:userObject:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"BLSAlwaysOnTimelineEntry.m";
  __int16 v10 = 1024;
  int v11 = 145;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1B55DE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end