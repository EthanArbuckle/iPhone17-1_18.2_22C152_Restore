@interface NightShiftDisplayWrapper
- (CBContainerProtocol)container;
- (NightShiftDisplayWrapper)init;
- (NightShiftDisplayWrapper)initWithDisplay:(__Display *)a3;
- (id)copyPreferenceForKey:(id)a3 user:(id)a4;
- (void)dealloc;
- (void)setContainer:(id)a3;
- (void)setNightShiftFactorDictionary:(id)a3;
- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5;
@end

@implementation NightShiftDisplayWrapper

- (NightShiftDisplayWrapper)initWithDisplay:(__Display *)a3
{
  v7 = self;
  SEL v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)NightShiftDisplayWrapper;
  v7 = [(NightShiftDisplayWrapper *)&v4 init];
  if (v7 && v5)
  {
    v7->_display = v5;
    CFRetain(v7->_display);
  }
  return v7;
}

- (NightShiftDisplayWrapper)init
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)NightShiftDisplayWrapper;
  return [(NightShiftDisplayWrapper *)&v3 init];
}

- (void)dealloc
{
  SEL v4 = self;
  SEL v3 = a2;
  if (self->_display) {
    CFRelease(v4->_display);
  }

  v2.receiver = v4;
  v2.super_class = (Class)NightShiftDisplayWrapper;
  [(NightShiftDisplayWrapper *)&v2 dealloc];
}

- (void)setNightShiftFactorDictionary:(id)a3
{
  if (self->_display) {
    DisplaySetProperty((uint64_t)self->_display, @"BlueLightReductionFactor", (uint64_t)a3);
  }
  else {
    [(CBContainerProtocol *)self->_container setProperty:a3 forKey:@"BlueLightReductionFactor"];
  }
}

- (id)copyPreferenceForKey:(id)a3 user:(id)a4
{
  return 0;
}

- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5
{
}

- (CBContainerProtocol)container
{
  return (CBContainerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainer:(id)a3
{
}

@end