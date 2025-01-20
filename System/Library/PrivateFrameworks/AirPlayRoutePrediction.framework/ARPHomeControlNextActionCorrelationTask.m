@interface ARPHomeControlNextActionCorrelationTask
- (ARPHomeControlCorrelationUtilities)utilities;
- (ARPHomeControlNextActionCorrelationTask)initWithCorrelationsFile:(id)a3;
- (ARPHomeControlSuggester)suggester;
- (NSString)file;
- (void)execute;
- (void)setSuggester:(id)a3;
- (void)setUtilities:(id)a3;
@end

@implementation ARPHomeControlNextActionCorrelationTask

- (ARPHomeControlNextActionCorrelationTask)initWithCorrelationsFile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARPHomeControlNextActionCorrelationTask;
  v5 = [(ARPHomeControlNextActionCorrelationTask *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    file = v5->_file;
    v5->_file = (NSString *)v6;

    v8 = objc_alloc_init(ARPHomeControlCorrelationUtilities);
    utilities = v5->_utilities;
    v5->_utilities = v8;

    uint64_t v10 = +[ARPHomeControlSuggester suggester];
    suggester = v5->_suggester;
    v5->_suggester = (ARPHomeControlSuggester *)v10;
  }
  return v5;
}

- (void)execute
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20BE41000, log, OS_LOG_TYPE_ERROR, "Skipping event - BMHomeKitClientBase is nil", buf, 2u);
}

- (NSString)file
{
  return self->_file;
}

- (ARPHomeControlCorrelationUtilities)utilities
{
  return self->_utilities;
}

- (void)setUtilities:(id)a3
{
}

- (ARPHomeControlSuggester)suggester
{
  return self->_suggester;
}

- (void)setSuggester:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end