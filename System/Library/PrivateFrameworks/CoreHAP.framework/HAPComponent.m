@interface HAPComponent
- (HAPBTLECentralManagerDelegate)centralManagerDelegate;
- (HAPComponent)initWithDelegate:(id)a3;
- (void)setCentralManagerDelegate:(id)a3;
@end

@implementation HAPComponent

- (void).cxx_destruct
{
}

- (void)setCentralManagerDelegate:(id)a3
{
}

- (HAPBTLECentralManagerDelegate)centralManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->centralManagerDelegate);

  return (HAPBTLECentralManagerDelegate *)WeakRetained;
}

- (HAPComponent)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(HAPComponent *)self init];
  v6 = v5;
  if (v5) {
    [(HAPComponent *)v5 setCentralManagerDelegate:v4];
  }

  return v6;
}

@end