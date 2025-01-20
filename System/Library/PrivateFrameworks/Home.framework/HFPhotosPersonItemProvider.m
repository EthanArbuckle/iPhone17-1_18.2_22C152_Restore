@interface HFPhotosPersonItemProvider
- (HFPhotosPersonItemProvider)initWithHome:(id)a3 forUser:(id)a4;
- (HFPhotosPersonItemProvider)initWithHome:(id)a3 personManager:(id)a4;
@end

@implementation HFPhotosPersonItemProvider

- (HFPhotosPersonItemProvider)initWithHome:(id)a3 forUser:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "hf_allUsersIncludingCurrentUser");
  char v9 = [v8 containsObject:v6];

  if (v9)
  {
    v10 = [v6 photosPersonManager];
    v15.receiver = self;
    v15.super_class = (Class)HFPhotosPersonItemProvider;
    v11 = [(HFPersonItemProvider *)&v15 initWithHome:v7 personManager:v10];

    self = v11;
    v12 = self;
  }
  else
  {
    v13 = objc_msgSend(v7, "hf_allUsersIncludingCurrentUser");
    NSLog(&cfstr_SHomeDoesnTInc_0.isa, self, "-[HFPhotosPersonItemProvider initWithHome:forUser:]", v7, v6, v13);

    v12 = 0;
  }

  return v12;
}

- (HFPhotosPersonItemProvider)initWithHome:(id)a3 personManager:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v7 = NSStringFromSelector(sel_initWithHome_forUser_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPersonItemProvider.m", 106, @"%s is unavailable; use %@ instead",
    "-[HFPhotosPersonItemProvider initWithHome:personManager:]",
    v7);

  return 0;
}

@end