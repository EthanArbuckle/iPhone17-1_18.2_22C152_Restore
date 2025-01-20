@interface MusicUIServiceApplication
- (id)_keyWindowForScreen:(id)a3;
@end

@implementation MusicUIServiceApplication

- (id)_keyWindowForScreen:(id)a3
{
  id v4 = a3;
  if ([v4 _userInterfaceIdiom] == (id)3)
  {
    v5 = [(MusicUIServiceApplication *)self delegate];
    v6 = [v5 _keyWindowForScreen:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MusicUIServiceApplication;
    v6 = [(MusicUIServiceApplication *)&v8 _keyWindowForScreen:v4];
  }

  return v6;
}

@end