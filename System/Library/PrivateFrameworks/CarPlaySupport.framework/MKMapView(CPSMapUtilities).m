@interface MKMapView(CPSMapUtilities)
- (void)_CPS_setCamera:()CPSMapUtilities animated:completionBlock:;
@end

@implementation MKMapView(CPSMapUtilities)

- (void)_CPS_setCamera:()CPSMapUtilities animated:completionBlock:
{
  id v21 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  char v19 = a4 & 1;
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  if (v19)
  {
    v17[1] = (id)0x3FED1EB851EB851FLL;
    LODWORD(v5) = 2.0;
    LODWORD(v6) = 1133903872;
    LODWORD(v7) = 1137180672;
    [v21 setCamera:location[0] duration:&__block_literal_global_11 springMass:0.91 springStiffness:v5 springDamping:v6 springVelocity:v7 completionHandler:0.0];
    dispatch_time_t when = dispatch_time(0, (uint64_t)(0.91 * 1000000000.0));
    queue = MEMORY[0x263EF83A0];
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    v15 = __70__MKMapView_CPSMapUtilities___CPS_setCamera_animated_completionBlock___block_invoke_2;
    v16 = &unk_2648A53F0;
    v17[0] = v18;
    dispatch_after(when, queue, &v12);

    objc_storeStrong(v17, 0);
  }
  else
  {
    [v21 setCamera:location[0] animated:0];
    if (v18) {
      (*((void (**)(void))v18 + 2))();
    }
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

@end