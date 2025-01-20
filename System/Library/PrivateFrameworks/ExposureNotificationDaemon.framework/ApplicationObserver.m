@interface ApplicationObserver
- (ApplicationObserver)delegate;
- (ApplicationObserver)init;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation ApplicationObserver

- (ApplicationObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)ApplicationObserver;
  v2 = [(ApplicationObserver *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F223D8] defaultWorkspace];
    [v3 addObserver:v2];

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F223D8] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ApplicationObserver;
  [(ApplicationObserver *)&v4 dealloc];
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  id v5 = [(ApplicationObserver *)self delegate];
  [v5 applicationsDidInstall:v4];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  id v5 = [(ApplicationObserver *)self delegate];
  [v5 applicationsDidUninstall:v4];
}

- (ApplicationObserver)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ApplicationObserver *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end