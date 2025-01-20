@interface BWDeferredIntermediate
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BWDeferredIntermediate)init;
- (BWDeferredIntermediate)initWithCoder:(id)a3;
- (BWDeferredIntermediate)initWithTag:(id)a3 URL:(id)a4;
- (NSString)tag;
- (NSURL)URL;
- (id)_shortString;
- (id)archive:(int *)a3;
- (id)fetchAndRetain:(int *)a3;
- (int)flush;
- (int)setURL:(id)a3 prefetchQueue:(id)a4;
- (int64_t)settingsID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSettingsID:(int64_t)a3;
@end

@implementation BWDeferredIntermediate

- (BWDeferredIntermediate)initWithTag:(id)a3 URL:(id)a4
{
  if (a3 && a4)
  {
    v7 = [(BWDeferredIntermediate *)self init];
    if (v7)
    {
      v7->_tag = (NSString *)a3;
      v7->_URL = (NSURL *)a4;
      v7->_dirty = 1;
    }
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

- (BWDeferredIntermediate)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredIntermediate;
  v2 = [(BWDeferredIntermediate *)&v5 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    pthread_cond_init(&v3->_cv, 0);
  }
  return v3;
}

- (NSString)tag
{
  return self->_tag;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredIntermediate)initWithCoder:(id)a3
{
  if (a3)
  {
    objc_super v5 = [(BWDeferredIntermediate *)self init];
    if (v5) {
      v5->_tag = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    }
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)dealloc
{
  pthread_cond_destroy(&self->_cv);
  pthread_mutex_destroy(&self->_lock);

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredIntermediate;
  [(BWDeferredIntermediate *)&v3 dealloc];
}

- (int)setURL:(id)a3 prefetchQueue:(id)a4
{
  return -16136;
}

- (id)fetchAndRetain:(int *)a3
{
  if (a3) {
    *a3 = -16136;
  }
  return 0;
}

- (int)flush
{
  return -16136;
}

- (id)archive:(int *)a3
{
  if (a3) {
    *a3 = -16136;
  }
  return 0;
}

- (id)_shortString
{
  return @"<unspecified>";
}

- (NSURL)URL
{
  return self->_URL;
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (void)setSettingsID:(int64_t)a3
{
  self->_settingsID = a3;
}

@end