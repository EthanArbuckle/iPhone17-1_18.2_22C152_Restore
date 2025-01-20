@interface HUMatterConnectedEcosystemItemProvider
- (BOOL)hasSystemCommissionerEcosystem;
- (id)futureFilteringOutSystemCommissionerEcosystem:(id)a3;
- (void)setHasSystemCommissionerEcosystem:(BOOL)a3;
@end

@implementation HUMatterConnectedEcosystemItemProvider

- (id)futureFilteringOutSystemCommissionerEcosystem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__HUMatterConnectedEcosystemItemProvider_futureFilteringOutSystemCommissionerEcosystem___block_invoke;
  v7[3] = &unk_1E6389138;
  objc_copyWeak(&v8, &location);
  v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

id __88__HUMatterConnectedEcosystemItemProvider_futureFilteringOutSystemCommissionerEcosystem___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(v3, "na_filter:", &__block_literal_global_68);
  unint64_t v6 = [v3 count];

  objc_msgSend(WeakRetained, "setHasSystemCommissionerEcosystem:", v6 > objc_msgSend(v5, "count"));
  v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v7;
}

uint64_t __88__HUMatterConnectedEcosystemItemProvider_futureFilteringOutSystemCommissionerEcosystem___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 vendor];
  uint64_t v3 = [v2 isSystemCommissionerVendor] ^ 1;

  return v3;
}

- (BOOL)hasSystemCommissionerEcosystem
{
  return self->_hasSystemCommissionerEcosystem;
}

- (void)setHasSystemCommissionerEcosystem:(BOOL)a3
{
  self->_hasSystemCommissionerEcosystem = a3;
}

@end