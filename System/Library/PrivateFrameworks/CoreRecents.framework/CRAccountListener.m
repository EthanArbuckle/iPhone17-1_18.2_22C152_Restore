@interface CRAccountListener
+ (id)_makeObservableForAccountStore:(id)a3;
+ (id)_makeObservableForMailAccount;
+ (id)appleAccountListenerForStore:(id)a3 withHandler:(id)a4;
+ (id)mailAccountListenerWithHandler:(id)a3;
@end

@implementation CRAccountListener

+ (id)mailAccountListenerWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019E7C;
  v4[3] = &unk_10002D4E0;
  v4[4] = a3;
  return objc_msgSend(objc_msgSend(a1, "_makeObservableForMailAccount"), "subscribe:", +[CNObserver observerWithResultBlock:](CNObserver, "observerWithResultBlock:", v4));
}

+ (id)appleAccountListenerForStore:(id)a3 withHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100019F20;
  v5[3] = &unk_10002D4E0;
  v5[4] = a4;
  return objc_msgSend(objc_msgSend(a1, "_makeObservableForAccountStore:", a3), "subscribe:", +[CNObserver observerWithResultBlock:](CNObserver, "observerWithResultBlock:", v5));
}

+ (id)_makeObservableForAccountStore:(id)a3
{
  return +[CNObservable observableOnDefaultNotificationCenterWithName:ACAccountStoreDidChangeNotification object:a3];
}

+ (id)_makeObservableForMailAccount
{
  return +[CNObservable observableWithBlock:&stru_10002D520];
}

@end